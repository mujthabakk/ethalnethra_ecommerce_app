import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/routes/app_router.dart';
import '../v2_assets.dart';
import 'kistcher_assets.dart';

/// Figma Kitchen "Tracking Order" — light Google map with black route,
/// rounded white sheet: status, stepper, partner, products, tip banner.
class KistcherOrderTrackingScreen extends StatelessWidget {
  const KistcherOrderTrackingScreen({super.key});

  static const _ink = Color(0xFF181724);
  static const _accent = Color(0xFFF2D262);
  static const _pending = Color(0xFFDADADA);
  static const _cream = Color(0xFFFDF6DF);
  static const _productFill = Color(0xFFFDFBF1);

  /// Figma map: pale grey ground, white roads, soft green parks.
  static const _mapStyle = '''
[
  {"elementType":"geometry","stylers":[{"color":"#F2F2F2"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#7A7A7A"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#FFFFFF"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#ECECEC"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#D7EBD0"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#FFFFFF"}]},
  {"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#E2E2E2"}]},
  {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#E4E4E4"}]},
  {"featureType":"transit","stylers":[{"visibility":"off"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#A9D3F5"}]}
]
''';

  // Zig-zag route matching the Figma path shape.
  static const _route = [
    LatLng(10.5285, 76.2098),
    LatLng(10.5291, 76.2122),
    LatLng(10.5283, 76.2136),
    LatLng(10.5277, 76.2147),
    LatLng(10.5280, 76.2170),
    LatLng(10.5298, 76.2171),
    LatLng(10.5298, 76.2181),
  ];

  static const _products = [
    (KistcherAssets.wishPodiIdli, 'Green Capsicum', '1 kg', '₹ 89.00'),
    (KistcherAssets.wishMasalaDosa, 'Green Capsicum', '1 kg', '₹ 89.00'),
    (KistcherAssets.wishBiriyani, 'Green Capsicum', '1 kg', '₹ 89.00'),
  ];

  /// 0 Accepted, 1 Packed, 2 Pickup (current), 3 Delivered.
  static const _activeStep = 2;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // Sheet starts where the Figma map ends (302 of a 932 frame).
    final sheetTop = (media.padding.top + 255).clamp(0.0, media.size.height);
    final initial = 1 - sheetTop / media.size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: sheetTop + 40,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(10.5288, 76.2140),
                  zoom: 15.6,
                ),
                style: _mapStyle,
                padding: EdgeInsets.only(top: media.padding.top + 60),
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: false,
                polylines: {
                  const Polyline(
                    polylineId: PolylineId('route'),
                    color: Colors.black,
                    width: 5,
                    jointType: JointType.mitered,
                    points: _route,
                  ),
                },
                circles: {
                  Circle(
                    circleId: const CircleId('dest'),
                    center: _route.last,
                    radius: 14,
                    fillColor: Colors.white,
                    strokeColor: const Color(0xFFF3C046),
                    strokeWidth: 4,
                  ),
                },
                markers: {
                  Marker(
                    markerId: const MarkerId('rider'),
                    position: _route.first,
                    icon: BitmapDescriptor.defaultMarkerWithHue(44),
                  ),
                },
              ),
            ),

            // Header over the map
            Positioned(
              top: media.padding.top + 35,
              left: 28,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go(AppRouter.kistcherHome);
                      }
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Text(
                    'Tracking Order',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: _ink,
                    ),
                  ),
                ],
              ),
            ),

            DraggableScrollableSheet(
              initialChildSize: initial,
              minChildSize: initial,
              maxChildSize: 0.92,
              builder: (context, controller) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(35)),
                  border: Border.all(color: const Color(0xFFCFCFCF)),
                ),
                child: ListView(
                  controller: controller,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                    30,
                    26,
                    28,
                    30 + media.padding.bottom,
                  ),
                  children: [
                    _buildStatus(),
                    const SizedBox(height: 28),
                    _buildStepper(),
                    const SizedBox(height: 40),
                    _buildPartner(),
                    const SizedBox(height: 34),
                    Text(
                      'Products in order',
                      style: GoogleFonts.poppins(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w500,
                        color: _ink,
                      ),
                    ),
                    const SizedBox(height: 22),
                    for (var i = 0; i < _products.length; i++) ...[
                      if (i > 0) const SizedBox(height: 21),
                      _buildProduct(_products[i]),
                    ],
                    const SizedBox(height: 30),
                    _buildTip(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus() {
    TextStyle big() => GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: _ink,
          height: 1.3,
        );
    TextStyle small() => GoogleFonts.poppins(
          fontSize: 12.5,
          fontWeight: FontWeight.w300,
          color: _ink,
          height: 1.3,
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Out for delivery', style: big()),
              const SizedBox(height: 7),
              Text('Arriving at 10:43 AM', style: small()),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('2344', style: big()),
            const SizedBox(height: 7),
            Text('Your code', style: small()),
          ],
        ),
      ],
    );
  }

  Widget _buildStepper() {
    const steps = [
      (KistcherAssets.trackAccepted, 18.0, 14.0, 'Accepted'),
      (KistcherAssets.trackPacked, 17.0, 17.0, 'Packed'),
      (KistcherAssets.trackPickup, 23.0, 17.0, 'Pickup'),
      (KistcherAssets.trackDelivered, 21.0, 21.0, 'Delivered'),
    ];
    const circle = 38.0;

    return SizedBox(
      height: 58,
      child: LayoutBuilder(
        builder: (context, c) {
          // Figma step centres within the 372px content width.
          final w = c.maxWidth;
          final centers = [16.0, 0.34 * w, 0.65 * w, w - 17];
          return Stack(
            clipBehavior: Clip.none,
            children: [
              for (var i = 0; i < steps.length - 1; i++)
                Positioned(
                  left: centers[i],
                  width: centers[i + 1] - centers[i],
                  top: circle / 2 - 1,
                  height: 2,
                  child: ColoredBox(
                    color: i < _activeStep ? _accent : _pending,
                  ),
                ),
              for (var i = 0; i < steps.length; i++) ...[
                Positioned(
                  left: centers[i] - circle / 2,
                  top: 0,
                  child: Container(
                    width: circle,
                    height: circle,
                    decoration: BoxDecoration(
                      color: i <= _activeStep ? _accent : _pending,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      steps[i].$1,
                      width: steps[i].$2,
                      height: steps[i].$3,
                    ),
                  ),
                ),
                Positioned(
                  left: centers[i] - 40,
                  width: 80,
                  top: circle + 4,
                  child: Text(
                    steps[i].$4,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: _ink,
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildPartner() {
    Widget action(String asset, double w, double h) => Container(
          width: 43,
          height: 43,
          decoration: const BoxDecoration(
            color: _cream,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(asset, width: w, height: h),
        );

    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            V2Assets.trackDriver,
            width: 46,
            height: 46,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const CircleAvatar(
              radius: 23,
              backgroundColor: _cream,
              child: Icon(Icons.person, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'James wiliams',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _ink,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Delivery Partner',
                style: GoogleFonts.poppins(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w300,
                  color: _ink,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        action(KistcherAssets.trackCall, 16, 21),
        const SizedBox(width: 12),
        action(KistcherAssets.trackChat, 21, 21),
      ],
    );
  }

  Widget _buildProduct((String, String, String, String) p) {
    return Container(
      height: 96,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _productFill,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(p.$1, width: 92, height: 84, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  p.$2,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: _ink,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  p.$3,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: _ink,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  p.$4,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: _ink,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTip() {
    return Container(
      height: 63,
      padding: const EdgeInsets.only(left: 13, right: 13),
      decoration: BoxDecoration(
        color: _cream,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 47,
            height: 44,
            decoration: BoxDecoration(
              color: _accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.volunteer_activism,
              size: 22,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a tip for your driver',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _ink,
                  ),
                ),
                Text(
                  'Show appreciations for great service',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w300,
                    color: _ink,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 72,
            height: 29,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: _accent, width: 1.2),
            ),
            child: Text(
              'Pay',
              style: GoogleFonts.poppins(
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: _ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
