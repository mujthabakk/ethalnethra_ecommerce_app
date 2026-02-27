import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      'asstes/images/home_banner.png',
      'asstes/images/home_banner.png',
      'asstes/images/home_banner.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 115,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
      ),
      items: banners.map((bannerPath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(bannerPath, fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
