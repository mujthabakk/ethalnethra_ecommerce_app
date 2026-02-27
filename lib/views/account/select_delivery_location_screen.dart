import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../../core/constants/app_colors.dart';

class SelectDeliveryLocationScreen extends StatefulWidget {
  const SelectDeliveryLocationScreen({super.key});

  @override
  State<SelectDeliveryLocationScreen> createState() =>
      _SelectDeliveryLocationScreenState();
}

class _SelectDeliveryLocationScreenState
    extends State<SelectDeliveryLocationScreen> {
  GoogleMapController? _mapController;
  LatLng _selectedPosition = const LatLng(
    10.5276,
    76.2144,
  ); // Default to Kerala
  final Set<Marker> _markers = {};
  String _selectedAddressType = 'HOME';
  final String _apiKey = "AIzaSyA9RITqSbjrdG8mPjO4d3mVMTUVnxoDLnA";

  // Controllers for editable fields
  final TextEditingController _areaController = TextEditingController(
    text: 'Puranattukara',
  );
  final TextEditingController _addressDetailsController =
      TextEditingController();
  final TextEditingController _receiverDetailsController =
      TextEditingController(text: 'Afsar Hossen,123456789');
  final TextEditingController _searchController = TextEditingController();

  // Places API related
  List<dynamic> _suggestions = [];
  String _sessionToken = const Uuid().v4();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _areaController.dispose();
    _addressDetailsController.dispose();
    _receiverDetailsController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition();
    _updateLocation(LatLng(position.latitude, position.longitude));
    _reverseGeocode(position.latitude, position.longitude);
  }

  void _updateLocation(LatLng position) {
    setState(() {
      _selectedPosition = position;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
        ),
      );
    });

    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(position, 15));
  }

  Future<void> _getSuggestions(String input) async {
    if (input.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }

    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$_apiKey&sessiontoken=$_sessionToken';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _suggestions = data['predictions'];
        });
      }
    } catch (e) {
      debugPrint('Error fetching suggestions: $e');
    }
  }

  Future<void> _getPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&fields=geometry,formatted_address&key=$_apiKey&sessiontoken=$_sessionToken';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final location = data['result']['geometry']['location'];
        final String address = data['result']['formatted_address'];

        final newPos = LatLng(location['lat'], location['lng']);
        _updateLocation(newPos);

        setState(() {
          _areaController.text = address.split(',').first;
          _addressDetailsController.text = address;
          _suggestions = [];
          _searchController.clear();
          _sessionToken = const Uuid().v4(); // Refresh token for next session
        });
      }
    } catch (e) {
      debugPrint('Error fetching place details: $e');
    }
  }

  Future<void> _reverseGeocode(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'].isNotEmpty) {
          final String address = data['results'][0]['formatted_address'];
          setState(() {
            _areaController.text = address.split(',').first;
            _addressDetailsController.text = address;
          });
        }
      }
    } catch (e) {
      debugPrint('Error reverse geocoding: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _selectedPosition,
                      zoom: 15,
                    ),
                    onMapCreated: (controller) => _mapController = controller,
                    markers: _markers,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    onTap: (pos) {
                      _updateLocation(pos);
                      _reverseGeocode(pos.latitude, pos.longitude);
                    },
                  ),
                  _buildSearchAndSuggestions(),
                  _buildUseCurrentLocationButton(),
                ],
              ),
            ),
            _buildBottomDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, size: 30),
            onPressed: () => context.pop(),
          ),
          Text(
            'Select delivery location',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndSuggestions() {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black54),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (val) => _getSuggestions(val),
                    decoration: InputDecoration(
                      hintText: 'Search for area, street name..',
                      hintStyle: GoogleFonts.poppins(color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_suggestions.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 5),
              // maxHeight: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = _suggestions[index];
                  return ListTile(
                    title: Text(
                      suggestion['description'],
                      style: GoogleFonts.poppins(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => _getPlaceDetails(suggestion['place_id']),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUseCurrentLocationButton() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: _getCurrentLocation,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.my_location,
                  color: Color(0xFFF3603F),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Use Current Location',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFF3603F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomDetails() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Delivery Details',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            _buildEditableField(
              Icons.location_on,
              'Area/Street',
              _areaController,
            ),
            const SizedBox(height: 15),
            _buildEditableField(
              null,
              'Address Details *',
              _addressDetailsController,
            ),
            const SizedBox(height: 15),
            Text(
              'Receiver Details for this address',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 10),
            _buildEditableField(
              null,
              'Receiver Name & Phone',
              _receiverDetailsController,
            ),
            const SizedBox(height: 15),
            Text(
              'Save address as',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildTypeButton('HOME', Icons.home),
                const SizedBox(width: 15),
                _buildTypeButton('WORK', Icons.work),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Save address logic
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000080),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Save Address',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(
    IconData? icon,
    String hint,
    TextEditingController controller,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: TextField(
              controller: controller,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(String label, IconData icon) {
    bool isSelected = _selectedAddressType == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedAddressType = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
