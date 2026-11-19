import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_widgets.dart';
import 'buy_sell_data.dart';
import 'buy_sell_widgets.dart';

/// Figma Buy & Sell item details.
class BuySellDetailsScreen extends StatefulWidget {
  const BuySellDetailsScreen({super.key, required this.listing});

  final BuySellListing listing;

  @override
  State<BuySellDetailsScreen> createState() => _BuySellDetailsScreenState();
}

class _BuySellDetailsScreenState extends State<BuySellDetailsScreen> {
  int _memory = 0;
  int _color = 0;

  BuySellListing get _l => widget.listing;

  Future<void> _call() async {
    final uri = Uri(scheme: 'tel', path: _l.phone);
    final ok = await canLaunchUrl(uri) && await launchUrl(uri);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Call ${_l.phone}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final pad = MediaQuery.paddingOf(context);
    final heroH = (size.height * 0.54).clamp(380.0, 520.0);

    return ServiceScaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40),
                      ),
                      child: SizedBox(
                        height: heroH,
                        width: double.infinity,
                        child: Image.asset(
                          _l.image,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          errorBuilder: (_, __, ___) => const ColoredBox(
                            color: Color(0xFFE9E4DD),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: pad.top + 22,
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.75),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: const Icon(Icons.arrow_back, size: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(24, 30, 24, 100 + pad.bottom),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      _l.fullTitle,
                      style: servicePoppins(size: 16.5, weight: FontWeight.w600),
                    ),
                    const SizedBox(height: 14),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: BuySellColors.featured,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(_l.dealTag, style: servicePoppins(size: 12.5)),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      _l.priceLabel,
                      style: servicePoppins(size: 20, weight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Text(_l.conditionDetail, style: servicePoppins(size: 13.5)),
                    const SizedBox(height: 6),
                    Text(
                      'Posted ${_l.postedAgo} in ${_l.postedIn}',
                      style: servicePoppins(size: 13.5),
                    ),
                    if (_l.memoryOptions.isNotEmpty) ...[
                      const SizedBox(height: 22),
                      _options(
                        'Memory',
                        _l.memoryOptions,
                        _memory,
                        (i) => setState(() => _memory = i),
                      ),
                    ],
                    if (_l.colorOptions.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      _options(
                        'Color',
                        _l.colorOptions,
                        _color,
                        (i) => setState(() => _color = i),
                      ),
                    ],
                    if (_l.details.isNotEmpty) ...[
                      const SizedBox(height: 26),
                      Text(
                        'Details',
                        style: servicePoppins(size: 14, weight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      for (final d in _l.details)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${d.$1}: ',
                                  style: servicePoppins(size: 13.5),
                                ),
                                TextSpan(
                                  text: d.$2,
                                  style: servicePoppins(
                                    size: 13.5,
                                    color: ServiceColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
            left: 30,
            right: 34,
            bottom: pad.bottom + 18,
            child: BuySellContactButton(onTap: _call),
          ),
        ],
      ),
    );
  }

  Widget _options(
    String title,
    List<String> values,
    int selected,
    ValueChanged<int> onTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: servicePoppins(size: 14, weight: FontWeight.w500)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var i = 0; i < values.length; i++)
              BuySellOptionChip(
                label: values[i],
                selected: i == selected,
                onTap: () => onTap(i),
              ),
          ],
        ),
      ],
    );
  }
}
