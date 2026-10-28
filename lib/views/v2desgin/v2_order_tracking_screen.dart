import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';

/// Figma Tracking Order — map + bottom sheet status / products / tip.
class V2OrderTrackingScreen extends StatefulWidget {
  const V2OrderTrackingScreen({super.key});

  @override
  State<V2OrderTrackingScreen> createState() => _V2OrderTrackingScreenState();
}

class _V2OrderTrackingScreenState extends State<V2OrderTrackingScreen> {
  static const _green = Color(0xFF0E5A03);
  static const _mint = Color(0xFFD1E0CF);
  static const _grey = Color(0xFFDADADA);

  static const _mapStyle = '''
[
  {"elementType":"geometry","stylers":[{"color":"#E8EEF2"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#8A9AA8"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#DDE5EA"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#D4E5D8"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#FFFFFF"}]},
  {"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#D5DEE5"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#C9D9E8"}]}
]
''';

  static const _origin = LatLng(10.5300, 76.2100);
  static const _dest = LatLng(10.5276, 76.2144);
  static const _mid = LatLng(10.5288, 76.2122);

  static const _products = [
    (V2Assets.trackProdCapsicum, 'Green Capsicum', '1 kg', '₹ 89.00'),
    (V2Assets.trackProdCarrot, 'Green Capsicum', '1 kg', '₹ 89.00'),
    (V2Assets.trackProdEgg, 'Green Capsicum', '1 kg', '₹ 89.00'),
  ];

  /// 0 Accepted, 1 Packed, 2 Pickup (current), 3 Delivered pending
  static const _activeStep = 2;

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFE8EEF2),
        body: Stack(
          fit: StackFit.expand,
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _mid,
                zoom: 14.8,
              ),
              style: _mapStyle,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              compassEnabled: false,
              mapToolbarEnabled: false,
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  color: _green,
                  width: 5,
                  points: const [_origin, _mid, _dest],
                ),
              },
              circles: {
                Circle(
                  circleId: const CircleId('dest'),
                  center: _dest,
                  radius: 28,
                  fillColor: Colors.white,
                  strokeColor: _green,
                  strokeWidth: 3,
                ),
              },
              markers: {
                Marker(
                  markerId: const MarkerId('driver'),
                  position: _mid,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen,
                  ),
                ),
              },
            ),

            // Header overlay
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Tracking Order',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 42),
                  ],
                ),
              ),
            ),

            // Map pin overlay (Figma Vector 14)
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.22,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  V2Assets.trackPin,
                  width: 40,
                  height: 48,
                  color: _green,
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.location_on,
                    size: 48,
                    color: _green,
                  ),
                ),
              ),
            ),

            // Bottom sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildSheet(bottomPad),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSheet(double bottomPad) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.68,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 14, 20, 16 + bottomPad),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildStatusHeader(),
                const SizedBox(height: 18),
                _buildStepper(),
                const SizedBox(height: 20),
                _buildDriver(),
                const SizedBox(height: 20),
                Text(
                  'Products in order',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ..._products.map(_productRow),
                const SizedBox(height: 14),
                _buildTipBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Out for delivery',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Arriving at 10:43 AM',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '2344',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'Your code',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepper() {
    final steps = [
      (null, Icons.check_rounded, 'Accepted'),
      (V2Assets.trackPacked, Icons.inventory_2_outlined, 'Packed'),
      (V2Assets.trackPickup, Icons.local_shipping_outlined, 'Pickup'),
      (V2Assets.trackDelivered, Icons.home_outlined, 'Delivered'),
    ];

    return Column(
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              final afterStep = i ~/ 2;
              final done = afterStep < _activeStep;
              return Expanded(
                child: Container(
                  height: 3,
                  color: done ? _green : _grey,
                ),
              );
            }
            final step = i ~/ 2;
            final done = step <= _activeStep;
            final s = steps[step];
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: done ? _green : _grey,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: step == 0
                  ? const Icon(Icons.check_rounded, size: 20, color: Colors.white)
                  : Image.asset(
                      s.$1!,
                      width: 18,
                      height: 18,
                      color: done ? Colors.white : Colors.black87,
                      colorBlendMode: BlendMode.srcIn,
                      errorBuilder: (_, __, ___) => Icon(
                        s.$2,
                        size: 18,
                        color: done ? Colors.white : Colors.black87,
                      ),
                    ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(steps.length, (i) {
            return Expanded(
              child: Text(
                steps[i].$3,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildDriver() {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            V2Assets.trackDriver,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 48,
              height: 48,
              color: _mint,
              child: const Icon(Icons.person, color: _green),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'James williams',
                style: GoogleFonts.poppins(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                'Delivery Partner',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        _actionCircle(
          asset: V2Assets.trackCall,
          fallback: Icons.phone_outlined,
        ),
        const SizedBox(width: 10),
        _actionCircle(
          asset: V2Assets.trackChat,
          fallback: Icons.chat_bubble_outline_rounded,
        ),
      ],
    );
  }

  Widget _actionCircle({required String asset, required IconData fallback}) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: _mint,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        asset,
        width: 18,
        height: 18,
        color: _green,
        colorBlendMode: BlendMode.srcIn,
        errorBuilder: (_, __, ___) => Icon(fallback, size: 18, color: _green),
      ),
    );
  }

  Widget _productRow((String, String, String, String) p) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _mint,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              p.$1,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 56,
                height: 56,
                color: Colors.white,
                child: const Icon(Icons.image_outlined),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.$2,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  p.$3,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Text(
            p.$4,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipBanner() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: _mint,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.volunteer_activism_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a tip for your driver',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Show appreciations for great service',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: _green,
              side: const BorderSide(color: _green, width: 1.2),
              minimumSize: const Size(64, 34),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Pay',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
