import 'package:flutter/material.dart';

import 'service_assets.dart';

/// Service category tile on the Our Services home grid.
class ServiceCategory {
  const ServiceCategory({
    required this.name,
    this.image,
    this.fallbackIcon = Icons.miscellaneous_services_rounded,
    this.providerTags = const [],
  });

  final String name;

  /// Asset path; `null` renders a gradient + icon placeholder.
  final String? image;
  final IconData fallbackIcon;

  /// Provider tags (Plumber, Driver…) that belong to this category.
  final List<String> providerTags;
}

/// Recommended banner item.
class RecommendedService {
  const RecommendedService({
    required this.title,
    required this.image,
    required this.duration,
    required this.rating,
    required this.priceRange,
    required this.category,
  });

  final String title;
  final String image;
  final String duration;
  final String rating;
  final String priceRange;
  final String category;
}

/// A bookable job type with its price (e.g. "Tap Leaking — ₹250").
class ServiceIssue {
  const ServiceIssue(this.title, this.price, {this.minutes = 30});

  final String title;
  final int price;
  final int minutes;
}

/// Service provider shown on the providers list / schedule page.
class ServiceProvider {
  const ServiceProvider({
    required this.name,
    required this.tag,
    required this.title,
    required this.phone,
    required this.issues,
    this.avatar = ServiceAssets.providerAvatar,
    this.pricePerDay = 500,
    this.rating = '4.3',
    this.reviews = 120,
    this.distanceKm = '1.4',
  });

  final String name;
  final String tag;
  final String title;
  final String phone;
  final String avatar;
  final int pricePerDay;
  final String rating;
  final int reviews;
  final String distanceKm;
  final List<ServiceIssue> issues;
}

abstract final class ServiceData {
  static const categories = <ServiceCategory>[
    ServiceCategory(
      name: 'Auto & taxi service',
      image: ServiceAssets.autoTaxi,
      providerTags: ['Driver'],
    ),
    ServiceCategory(
      name: 'Pharmacy',
      image: ServiceAssets.pharmacy,
      providerTags: ['Pharmacist'],
    ),
    ServiceCategory(
      name: 'Real Estate',
      image: ServiceAssets.realEstate,
      providerTags: ['Agent'],
    ),
    ServiceCategory(
      name: 'Gold loan',
      image: ServiceAssets.goldLoan,
      providerTags: ['Advisor'],
    ),
    ServiceCategory(
      name: 'Laundry',
      image: ServiceAssets.laundry,
      providerTags: ['Cleaner'],
    ),
    ServiceCategory(
      name: 'Finance',
      image: ServiceAssets.finance,
      providerTags: ['Advisor'],
    ),
    ServiceCategory(
      name: 'House keeping',
      image: ServiceAssets.houseKeeping,
      providerTags: ['Cleaner', 'Plumber'],
    ),
    ServiceCategory(
      name: 'Painting',
      image: ServiceAssets.paintingTile,
      providerTags: ['Painter'],
    ),
    ServiceCategory(
      name: 'Buy & Sell',
      fallbackIcon: Icons.storefront_rounded,
    ),
    ServiceCategory(
      name: 'Painting materials',
      fallbackIcon: Icons.format_paint_rounded,
      providerTags: ['Painter'],
    ),
    ServiceCategory(
      name: 'Spare Parts',
      fallbackIcon: Icons.build_circle_outlined,
      providerTags: ['Mechanic'],
    ),
  ];

  static const recommended = <RecommendedService>[
    RecommendedService(
      title: 'Painting Service',
      image: ServiceAssets.painting,
      duration: '2 - 3 days',
      rating: '4.3',
      priceRange: '₹ 1200 - ₹ 2000',
      category: 'Painting',
    ),
    RecommendedService(
      title: 'House Keeping',
      image: ServiceAssets.houseKeeping,
      duration: '1 day',
      rating: '4.5',
      priceRange: '₹ 500 - ₹ 900',
      category: 'House keeping',
    ),
    RecommendedService(
      title: 'Laundry Service',
      image: ServiceAssets.laundry,
      duration: '1 - 2 days',
      rating: '4.2',
      priceRange: '₹ 150 - ₹ 400',
      category: 'Laundry',
    ),
  ];

  static const _plumbing = [
    ServiceIssue('Tap Leaking', 250),
    ServiceIssue('Installation', 199),
    ServiceIssue('Repair', 240),
    ServiceIssue('Drain Blockage', 500, minutes: 60),
  ];

  static const _cleaning = [
    ServiceIssue('Deep Cleaning', 799, minutes: 120),
    ServiceIssue('Kitchen Cleaning', 399, minutes: 60),
    ServiceIssue('Bathroom Cleaning', 299, minutes: 45),
    ServiceIssue('Sofa Cleaning', 349, minutes: 45),
  ];

  static const _painting = [
    ServiceIssue('Single Wall', 1200, minutes: 240),
    ServiceIssue('Full Room', 2000, minutes: 480),
    ServiceIssue('Touch Up', 499, minutes: 90),
    ServiceIssue('Texture Work', 1500, minutes: 300),
  ];

  static const _driving = [
    ServiceIssue('Local Ride', 250, minutes: 60),
    ServiceIssue('Airport Drop', 799, minutes: 90),
    ServiceIssue('Outstation (per day)', 1800, minutes: 480),
    ServiceIssue('Hourly Driver', 199, minutes: 60),
  ];

  static const _general = [
    ServiceIssue('Consultation', 199),
    ServiceIssue('Home Visit', 299, minutes: 45),
    ServiceIssue('Standard Service', 499, minutes: 60),
  ];

  static const providers = <ServiceProvider>[
    ServiceProvider(
      name: 'Ramesh Kumar',
      tag: 'Plumber',
      title: 'Expert Plumber',
      phone: '+91 8464 *** ***',
      issues: _plumbing,
    ),
    ServiceProvider(
      name: 'Suresh Krishna',
      tag: 'Cleaner',
      title: 'Expert Cleaner',
      phone: '+91 8464 *** ***',
      issues: _cleaning,
    ),
    ServiceProvider(
      name: 'Deepu',
      tag: 'Painter',
      title: 'Expert Painter',
      phone: '+91 8464 *** ***',
      issues: _painting,
    ),
    ServiceProvider(
      name: 'Sathyan',
      tag: 'Driver',
      title: 'Expert Driver',
      phone: '+91 8464 *** ***',
      issues: _driving,
    ),
    ServiceProvider(
      name: 'Taxi Service',
      tag: 'Driver',
      title: 'Taxi Service',
      phone: '+91 8464 *** ***',
      issues: _driving,
    ),
    ServiceProvider(
      name: 'Anil Mathew',
      tag: 'Advisor',
      title: 'Finance Advisor',
      phone: '+91 8464 *** ***',
      issues: _general,
    ),
    ServiceProvider(
      name: 'Joseph',
      tag: 'Mechanic',
      title: 'Expert Mechanic',
      phone: '+91 8464 *** ***',
      issues: _general,
    ),
  ];

  /// Providers for a category; all providers when the category has none.
  static List<ServiceProvider> providersFor(String category) {
    final match = categories.where((c) => c.name == category);
    if (match.isEmpty) return providers;
    final tags = match.first.providerTags;
    final list = providers.where((p) => tags.contains(p.tag)).toList();
    return list.isEmpty ? providers : list;
  }
}
