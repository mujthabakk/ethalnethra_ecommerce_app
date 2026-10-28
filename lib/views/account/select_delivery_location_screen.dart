import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import '../../core/routes/app_router.dart';

/// Figma: Choose delivery location — exact layout + light map style.
class SelectDeliveryLocationScreen extends StatefulWidget {
  const SelectDeliveryLocationScreen({super.key});

  @override
  State<SelectDeliveryLocationScreen> createState() =>
      _SelectDeliveryLocationScreenState();
}

class _SelectDeliveryLocationScreenState
    extends State<SelectDeliveryLocationScreen> {
  static const _apiKey = 'AIzaSyA9RITqSbjrdG8mPjO4d3mVMTUVnxoDLnA';
  static const _green = Color(0xFF0E5A03);
  static const _mint = Color(0xFFDEFFD9);
  static const _beige = Color(0xFFF2EDE7);

  static const _pinAsset =
      'asstes/v2desgin/images/add_adders_page/Group 6984.png';
  static const _vectorPin =
      'asstes/v2desgin/images/add_adders_page/Vector.png';
  static const _shippingAsset =
      'asstes/v2desgin/images/add_adders_page/fast-shipping 1.png';

  /// Soft light-blue / grey map (Figma look).
  static const _mapStyle = '''
[
  {"elementType":"geometry","stylers":[{"color":"#E8EEF2"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#8A9AA8"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#E8EEF2"}]},
  {"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#C5D0D8"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#DDE5EA"}]},
  {"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#8A9AA8"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#D4E5D8"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#FFFFFF"}]},
  {"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#D5DEE5"}]},
  {"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#F5F7F9"}]},
  {"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#C9D4DC"}]},
  {"featureType":"transit","stylers":[{"visibility":"off"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#C9D9E8"}]},
  {"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#7A8FA3"}]}
]
''';

  GoogleMapController? _mapController;
  LatLng _selectedPosition = const LatLng(10.5276, 76.2144);
  bool _mapReady = false;
  bool _moving = false;

  String _titleLine = 'APR 34 Karayil Lane,';
  String _subtitleLine = 'West Fort, Thrissur, 78655';

  final _searchController = TextEditingController();
  List<dynamic> _suggestions = [];
  String _sessionToken = const Uuid().v4();

  /// Bottom floating card approx height for "Use current location" placement.
  static const _cardApproxHeight = 278.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    final position = await Geolocator.getCurrentPosition();
    final latLng = LatLng(position.latitude, position.longitude);
    await _moveCamera(latLng);
    _reverseGeocode(latLng.latitude, latLng.longitude);
  }

  Future<void> _moveCamera(LatLng position) async {
    if (!mounted) return;
    setState(() => _selectedPosition = position);
    await _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(position, 16),
    );
  }

  Future<void> _getSuggestions(String input) async {
    if (input.isEmpty) {
      if (!mounted) return;
      setState(() => _suggestions = []);
      return;
    }
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        '?input=${Uri.encodeComponent(input)}'
        '&key=$_apiKey'
        '&sessiontoken=$_sessionToken'
        '&components=country:in';

    try {
      final response = await http.get(Uri.parse(url));
      if (!mounted) return;
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() => _suggestions = data['predictions'] ?? []);
      }
    } catch (e) {
      debugPrint('Suggestions error: $e');
    }
  }

  Future<void> _getPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json'
        '?placeid=$placeId'
        '&fields=geometry,formatted_address,name'
        '&key=$_apiKey'
        '&sessiontoken=$_sessionToken';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final result = data['result'];
        final location = result['geometry']['location'];
        final address = result['formatted_address'] as String? ?? '';
        final newPos = LatLng(location['lat'], location['lng']);
        await _moveCamera(newPos);
        _applyAddress(address);
        if (!mounted) return;
        setState(() {
          _suggestions = [];
          _searchController.clear();
          _sessionToken = const Uuid().v4();
        });
      }
    } catch (e) {
      debugPrint('Place details error: $e');
    }
  }

  Future<void> _reverseGeocode(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json'
        '?latlng=$lat,$lng&key=$_apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if ((data['results'] as List).isNotEmpty) {
          _applyAddress(data['results'][0]['formatted_address'] as String);
        }
      }
    } catch (e) {
      debugPrint('Reverse geocode error: $e');
    }
  }

  void _applyAddress(String address) {
    if (!mounted) return;
    final parts = address.split(',').map((e) => e.trim()).toList();
    setState(() {
      _titleLine = parts.isNotEmpty ? '${parts.first},' : address;
      _subtitleLine = parts.length > 1
          ? parts.skip(1).take(3).join(', ')
          : address;
    });
  }

  Future<void> _onCameraIdle() async {
    if (_mapController == null) return;
    setState(() => _moving = false);
    final bounds = await _mapController!.getVisibleRegion();
    // Center of visible map (pin is fixed overlay)
    final center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );
    // Bias center upward slightly because bottom card covers map
    final biased = LatLng(
      center.latitude +
          (bounds.northeast.latitude - bounds.southwest.latitude) * 0.08,
      center.longitude,
    );
    setState(() => _selectedPosition = biased);
    _reverseGeocode(biased.latitude, biased.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFE8EEF2),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Full-bleed map
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _selectedPosition,
                zoom: 15.5,
              ),
              style: _mapStyle,
              onMapCreated: (c) {
                _mapController = c;
                if (mounted) setState(() => _mapReady = true);
              },
              markers: const {},
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              compassEnabled: false,
              mapToolbarEnabled: false,
              buildingsEnabled: false,
              onCameraMoveStarted: () => setState(() => _moving = true),
              onCameraIdle: _onCameraIdle,
            ),

            // Very light fade only — map must stay visible (Figma: no top card)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 120,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.28),
                        Colors.white.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Fixed center pin (Figma) — with red glow
            Positioned.fill(
              child: IgnorePointer(
                child: Align(
                  alignment: const Alignment(0, -0.12),
                  child: _CenterPin(asset: _pinAsset, moving: _moving),
                ),
              ),
            ),

            // Floating top controls over map (not inside a white card)
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopHeader(),
                    const SizedBox(height: 14),
                    _buildSearchBar(),
                    if (_suggestions.isNotEmpty) _buildSuggestions(),
                  ],
                ),
              ),
            ),

            // Use current location — floating above bottom card
            Positioned(
              left: 0,
              right: 0,
              bottom: _cardApproxHeight + bottomSafe + 20,
              child: Center(child: _buildUseCurrentLocation()),
            ),

            // Bottom floating confirm card (Figma: inset + all-round radius)
            Positioned(
              left: 14,
              right: 14,
              bottom: 12 + bottomSafe,
              child: _buildBottomCard(),
            ),

            if (!_mapReady)
              const ColoredBox(
                color: Color(0xFFE8EEF2),
                child: Center(
                  child: CircularProgressIndicator(color: _green),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRouter.v2Home);
            }
          },
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE8E8E8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose delivery location',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Select where you'd like your groceries delivered",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B6B6B),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE6E6E6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF9E9E9E), size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: _getSuggestions,
              style: GoogleFonts.poppins(fontSize: 13.5, color: Colors.black),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Search by street, area or building',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 13.5,
                  color: const Color(0xFFB0B0B0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      constraints: const BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 4),
        itemCount: _suggestions.length.clamp(0, 6),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final s = _suggestions[index];
          return ListTile(
            dense: true,
            leading: Image.asset(_vectorPin, width: 18, height: 22),
            title: Text(
              s['description'] ?? '',
              style: GoogleFonts.poppins(fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => _getPlaceDetails(s['place_id']),
          );
        },
      ),
    );
  }

  Widget _buildUseCurrentLocation() {
    return GestureDetector(
      onTap: _getCurrentLocation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE5E5E5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.my_location, size: 18, color: Colors.black87),
            const SizedBox(width: 8),
            Text(
              'Use current location',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCard() {
    const radius = 22.0;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.14),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Beige header strip
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: _beige,
              child: Text(
                'Order will be delivered here',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3D3D3D),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                children: [
                  // Address row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Image.asset(
                          _vectorPin,
                          width: 18,
                          height: 24,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.location_on,
                            color: _green,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _titleLine,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                height: 1.25,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _subtitleLine,
                              style: GoogleFonts.poppins(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF7A7A7A),
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Delivery available chip
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    decoration: BoxDecoration(
                      color: _mint,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          _shippingAsset,
                          width: 34,
                          height: 34,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.delivery_dining,
                            color: _green,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery Available',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: _green,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text.rich(
                                TextSpan(
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: _green.withValues(alpha: 0.9),
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'Estimated delivery : ',
                                    ),
                                    TextSpan(
                                      text: '20-30 min',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: _green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop({
                            'lat': _selectedPosition.latitude,
                            'lng': _selectedPosition.longitude,
                            'title': _titleLine,
                            'subtitle': _subtitleLine,
                          });
                        } else {
                          context.go(AppRouter.v2Home);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Confirm Location',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fixed center pin with soft red glow (matches Figma Group 6984).
class _CenterPin extends StatelessWidget {
  const _CenterPin({required this.asset, required this.moving});

  final String asset;
  final bool moving;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 120),
      offset: moving ? const Offset(0, -0.08) : Offset.zero,
      child: SizedBox(
        width: 90,
        height: 110,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Soft red glow under pin tip
            Positioned(
              bottom: 6,
              child: Container(
                width: moving ? 28 : 42,
                height: moving ? 10 : 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFF3B30).withValues(alpha: 0.45),
                      const Color(0xFFFF3B30).withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Image.asset(
                asset,
                width: 72,
                height: 86,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
