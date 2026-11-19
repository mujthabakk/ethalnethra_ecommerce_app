import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_router.dart';
import '../service_widgets.dart';
import 'real_estate_data.dart';
import 'real_estate_widgets.dart';

/// Figma "Featured Listings" see-all page.
class RealEstateFeaturedScreen extends StatelessWidget {
  const RealEstateFeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = RealEstateData.featured;
    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: ServicePageHeader(title: 'Featured Listings'),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20,
                  6,
                  20,
                  24 + MediaQuery.paddingOf(context).bottom,
                ),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 22),
                itemBuilder: (_, i) => FeaturedPropertyCard(
                  property: items[i],
                  imageHeight: 205,
                  onTap: () => context.push(
                    AppRouter.realEstateDetails,
                    extra: items[i],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
