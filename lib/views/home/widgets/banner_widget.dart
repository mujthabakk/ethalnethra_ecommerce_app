import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/models/catalog/banner_item.dart';
import '../../../core/widgets/app_network_image.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key, required this.banners});

  final List<BannerItem> banners;

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'asstes/images/home_banner.png',
          height: 115,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 115,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Fresh groceries',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF53B175),
              ),
            ),
          ),
        ),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 115,
        viewportFraction: 1.0,
        autoPlay: banners.length > 1,
        enlargeCenterPage: false,
      ),
      items: banners.map((b) {
        return Builder(
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage(
                  path: b.imageUrl,
                  fit: BoxFit.cover,
                  height: 115,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
