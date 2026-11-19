import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_widgets.dart';
import 'spare_parts_data.dart';
import 'spare_parts_widgets.dart';

/// Figma spare part "Details" — photo carousel, description, spec gauges.
class SparePartsDetailsScreen extends StatefulWidget {
  const SparePartsDetailsScreen({super.key, required this.part});

  final SparePart part;

  @override
  State<SparePartsDetailsScreen> createState() =>
      _SparePartsDetailsScreenState();
}

class _SparePartsDetailsScreenState extends State<SparePartsDetailsScreen> {
  final _pager = PageController();
  int _page = 0;

  SparePart get _p => widget.part;

  @override
  void dispose() {
    _pager.dispose();
    super.dispose();
  }

  Future<void> _call() async {
    final uri = Uri(scheme: 'tel', path: _p.phone);
    final ok = await canLaunchUrl(uri) && await launchUrl(uri);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Call ${_p.phone}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final count = _p.galleryCount.clamp(1, 10);

    return ServiceScaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: ServicePageHeader(title: 'Details'),
                  ),
                ),
                SliverToBoxAdapter(child: _buildCarousel(count)),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(26, 10, 26, 110 + bottom),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              _p.name,
                              style: servicePoppins(
                                size: 27,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const ServiceIcon(
                            SparePartsAssets.star,
                            size: 22,
                            fallback: Icons.star_rounded,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${_p.rating} (${_p.reviews})',
                            style: servicePoppins(size: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      PartPrice(
                        price: _p.priceLabel,
                        size: 22,
                        periodColor: ServiceColors.textPrimary,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Product description',
                        style: servicePoppins(size: 16, weight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _p.description,
                        style: servicePoppins(size: 13.5, height: 1.65),
                      ),
                      if (_p.specs.isNotEmpty) ...[
                        const SizedBox(height: 26),
                        Text(
                          'Specifications',
                          style: servicePoppins(
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 16,
                            childAspectRatio: 157 / 88,
                          ),
                          itemCount: _p.specs.length,
                          itemBuilder: (_, i) => _SpecTile(spec: _p.specs[i]),
                        ),
                      ],
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: bottom + 18,
            child: _GlassContactButton(onTap: _call),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(int count) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pager,
            itemCount: count,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, __) => ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black, Colors.transparent],
                stops: [0, 0.8, 1],
              ).createShader(rect),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Image.asset(
                  _p.image,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.build_circle_outlined,
                    size: 80,
                    color: ServiceColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (count > 1) ...[
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(count, (i) {
              final active = i == _page;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: active ? 22 : 4,
                height: 4,
                decoration: BoxDecoration(
                  color: active
                      ? ServiceColors.primary
                      : ServiceColors.primary.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}

class _SpecTile extends StatelessWidget {
  const _SpecTile({required this.spec});

  final PartSpec spec;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 10, 12),
      decoration: BoxDecoration(
        gradient: SparePartsColors.card(),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: spec.value,
                          style: servicePoppins(size: 19),
                        ),
                        TextSpan(
                          text: '  ${spec.unit}',
                          style: servicePoppins(size: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.75),
                  shape: BoxShape.circle,
                ),
                child: ServiceIcon(
                  spec.icon,
                  size: 18,
                  fallback: Icons.speed,
                ),
              ),
            ],
          ),
          Text(spec.label, style: servicePoppins(size: 12.5)),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: spec.progress.clamp(0, 1),
                backgroundColor: SparePartsColors.barTrack,
                valueColor: const AlwaysStoppedAnimation(
                  SparePartsColors.barFill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Frosted blue "Get in touch" pill.
class _GlassContactButton extends StatelessWidget {
  const _GlassContactButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white.withValues(alpha: 0.55),
                  SparePartsColors.blue.withValues(alpha: 0.55),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withValues(alpha: 0.6)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 2,
                  child: Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFF6FC),
                      shape: BoxShape.circle,
                    ),
                    child: const ServiceIcon(
                      SparePartsAssets.phone,
                      size: 16,
                      fallback: Icons.call,
                    ),
                  ),
                ),
                Text(
                  'Get in touch',
                  style: servicePoppins(
                    size: 15,
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
