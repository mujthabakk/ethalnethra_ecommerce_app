import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_widgets.dart';
import 'real_estate_data.dart';
import 'real_estate_widgets.dart';

/// Figma property details — hero photo, specs, gallery, about, localities.
class RealEstateDetailsScreen extends StatelessWidget {
  const RealEstateDetailsScreen({super.key, required this.property});

  final Property property;

  static const _localityBg = Color(0xFFE8F2FC);

  Future<void> _call(BuildContext context) async {
    final uri = Uri(scheme: 'tel', path: property.phone);
    final ok = await canLaunchUrl(uri) && await launchUrl(uri);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Call ${property.phone}')));
    }
  }

  void _openGallery(BuildContext context, int initial) {
    final photos = [
      property.image,
      ...property.gallery.whereType<String>(),
    ];
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => _PhotoViewer(
          photos: photos,
          initial: initial.clamp(0, photos.length - 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final pad = MediaQuery.paddingOf(context);
    final heroH = (size.height * 0.47).clamp(360.0, 460.0);
    const sheetOverlap = 22.0;
    const specsH = 66.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _Hero(property: property, height: heroH),
                  Positioned(
                    top: pad.top + 16,
                    left: 20,
                    child: ServiceCircleButton(
                      size: 46,
                      onTap: () => context.pop(),
                      child: const Icon(Icons.arrow_back, size: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: heroH - sheetOverlap),
                    padding: EdgeInsets.fromLTRB(
                      20,
                      specsH / 2 + 30,
                      20,
                      110 + pad.bottom,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Gallery(
                          property: property,
                          onTap: (i) => _openGallery(context, i),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'About Property',
                          style: servicePoppins(
                            size: 17,
                            weight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          property.description,
                          style: servicePoppins(size: 13.5, height: 1.65),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Nearby localities',
                          style: servicePoppins(
                            size: 17,
                            weight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 10,
                          runSpacing: 14,
                          children: [
                            for (final l in property.localities)
                              _LocalityChip(locality: l),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: heroH - sheetOverlap - specsH / 2,
                    left: 34,
                    right: 34,
                    child: _SpecsCard(property: property, height: specsH),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: pad.bottom + 16,
              child: _GetInTouchButton(onTap: () => _call(context)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.property, required this.height});

  final Property property;
  final double height;

  @override
  Widget build(BuildContext context) {
    final white = servicePoppins(color: Colors.white);
    const fade = [Colors.transparent, Colors.black];
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          realEstateImage(property.image),
          // Progressive blur: a blurred copy that fades in toward the bottom.
          ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: fade,
              stops: [0.6, 0.78],
            ).createShader(rect),
            blendMode: BlendMode.dstIn,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: realEstateImage(property.image),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.28),
                ],
                stops: const [0.6, 1],
              ),
            ),
          ),
          Positioned(
            left: 34,
            right: 34,
            bottom: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: white.copyWith(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              property.location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: white.copyWith(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      property.priceLabel,
                      style: white.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      property.isRent ? 'per month' : property.dealLabel,
                      style: white.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecsCard extends StatelessWidget {
  const _SpecsCard({required this.property, required this.height});

  final Property property;
  final double height;

  @override
  Widget build(BuildContext context) {
    Widget item(String icon, IconData fallback, String label) => Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 24,
                height: 22,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                errorBuilder: (_, __, ___) => Icon(fallback, size: 22),
              ),
              const SizedBox(height: 6),
              Text(label, style: servicePoppins(size: 12.5)),
            ],
          ),
        );
    Widget divider() => Container(
          width: 1,
          height: 30,
          color: const Color(0xFF9E9E9E),
        );

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          item(RealEstateAssets.bed, Icons.bed_outlined, '${property.beds} beds'),
          divider(),
          item(
            RealEstateAssets.bath,
            Icons.bathtub_outlined,
            '${property.baths} baths',
          ),
          divider(),
          item(RealEstateAssets.area, Icons.crop_square, property.sqftLabel),
        ],
      ),
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.property, required this.onTap});

  final Property property;
  final ValueChanged<int> onTap;

  static const _placeholders = [
    (Icons.weekend_outlined, 'Living room'),
    (Icons.kitchen_outlined, 'Kitchen'),
    (Icons.bathtub_outlined, 'Bathroom'),
    (Icons.bed_outlined, 'Bedroom'),
  ];

  Widget _tile(int i, {Widget? overlay}) {
    final path = i < property.gallery.length ? property.gallery[i] : null;
    final ph = _placeholders[i % _placeholders.length];
    return GestureDetector(
      onTap: () => onTap(path == null ? 0 : i + 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (path != null)
              realEstateImage(path)
            else
              DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFEFEAE3), Color(0xFFD9CFC2)],
                  ),
                ),
                child: Icon(ph.$1, size: 34, color: const Color(0xFF8C7B68)),
              ),
            if (overlay != null) overlay,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final more = property.extraPhotos;
    return SizedBox(
      height: 178,
      child: Row(
        children: [
          Expanded(flex: 42, child: _tile(0)),
          const SizedBox(width: 10),
          Expanded(
            flex: 58,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _tile(1)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _tile(
                          2,
                          overlay: more <= 0
                              ? null
                              : ColoredBox(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  child: Center(
                                    child: Text(
                                      '+$more\nmore',
                                      textAlign: TextAlign.center,
                                      style: servicePoppins(
                                        size: 13,
                                        weight: FontWeight.w500,
                                        color: Colors.white,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 9),
                Expanded(child: _tile(3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LocalityChip extends StatelessWidget {
  const _LocalityChip({required this.locality});

  final NearbyLocality locality;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
      decoration: BoxDecoration(
        color: RealEstateDetailsScreen._localityBg,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: ServiceColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(locality.icon, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Text(locality.label, style: servicePoppins(size: 14)),
        ],
      ),
    );
  }
}

class _GetInTouchButton extends StatelessWidget {
  const _GetInTouchButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ServiceColors.primary,
      borderRadius: BorderRadius.circular(30),
      elevation: 4,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: SizedBox(
          height: 52,
          child: Row(
            children: [
              const SizedBox(width: 15),
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.call, size: 18, color: Colors.black),
              ),
              const SizedBox(width: 24),
              Text(
                'Get in touch',
                style: servicePoppins(
                  size: 17,
                  weight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Fullscreen swipeable photo viewer.
class _PhotoViewer extends StatelessWidget {
  const _PhotoViewer({required this.photos, required this.initial});

  final List<String> photos;
  final int initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView.builder(
        controller: PageController(initialPage: initial),
        itemCount: photos.length,
        itemBuilder: (_, i) => InteractiveViewer(
          child: Center(child: realEstateImage(photos[i], fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
