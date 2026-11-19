import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Buy & Sell image paths under `asstes/v2desgin/service/Buy_and_sell/`.
abstract final class BuySellAssets {
  static const String _base = 'asstes/v2desgin/service/Buy_and_sell';

  static const String toyota = '$_base/Frame 7937.png';
  static const String iphoneBlueHand = '$_base/Frame 7938 (1).png';
  static const String iphone15 = '$_base/Frame 7938.png';
  static const String galaxyTab = '$_base/Frame 7939.png';
  static const String iphone15Alt = '$_base/Frame 7940.png';
  static const String iphoneGoldBox = '$_base/Frame 7976.png';
  static const String iphoneSilverHand = '$_base/Frame 7977.png';
  static const String iphoneBlueWindow = '$_base/Frame 7978.png';
  static const String promoCar = '$_base/image-Photoroom (65) 1.png';

  static const String logo = '$_base/Group 6912.png';
  static const String filterWhite = '$_base/Group (12).png';
  static const String pinBlue = '$_base/Group (13).png';
  static const String star = '$_base/Star 2 (3).png';
  static const String heartWhite = '$_base/Vector (14).png';
  static const String pinWhite = '$_base/Vector (15).png';
}

class BuySellCategory {
  const BuySellCategory(this.name, this.key, {this.image, required this.icon});

  final String name;

  /// Matches [BuySellListing.category].
  final String key;
  final String? image;
  final IconData icon;
}

class BuySellListing {
  const BuySellListing({
    required this.id,
    required this.title,
    required this.fullTitle,
    required this.image,
    required this.price,
    required this.category,
    this.isNew = false,
    this.featured = false,
    this.conditionDetail = 'Used - Very good',
    this.location = 'Westfort, Thrissur',
    this.postedAgo = '2 day ago',
    this.postedIn = 'Kannur, Kerala',
    this.rating = '4.3',
    this.reviews = 120,
    this.dealTag = 'Good Deal',
    this.memoryOptions = const [],
    this.colorOptions = const [],
    this.details = const [],
    this.phone = '+918464000000',
  });

  final String id;

  /// Card title ("I Phone 15").
  final String title;

  /// Details-page title ("I Phone 15 pro max - 128 GB - Black").
  final String fullTitle;
  final String image;
  final int price;
  final String category;
  final bool isNew;
  final bool featured;
  final String conditionDetail;
  final String location;
  final String postedAgo;
  final String postedIn;
  final String rating;
  final int reviews;
  final String dealTag;
  final List<String> memoryOptions;
  final List<String> colorOptions;

  /// (label, value) pairs for the "Details" block.
  final List<(String, String)> details;
  final String phone;

  String get conditionLabel => isNew ? 'New' : 'Used';
  String get priceLabel => '₹ ${formatInr(price)}';
}

/// 112000 → "1,12,000" (Indian grouping).
String formatInr(int value) {
  final s = value.toString();
  if (s.length <= 3) return s;
  final last3 = s.substring(s.length - 3);
  var rest = s.substring(0, s.length - 3);
  final parts = <String>[];
  while (rest.length > 2) {
    parts.insert(0, rest.substring(rest.length - 2));
    rest = rest.substring(0, rest.length - 2);
  }
  if (rest.isNotEmpty) parts.insert(0, rest);
  return '${parts.join(',')},$last3';
}

enum BuySellCondition { all, newOnly, usedOnly }

enum BuySellSort { relevance, priceLow, priceHigh }

class BuySellFilter {
  const BuySellFilter({
    this.condition = BuySellCondition.all,
    this.sort = BuySellSort.relevance,
  });

  final BuySellCondition condition;
  final BuySellSort sort;

  bool get isDefault =>
      condition == BuySellCondition.all && sort == BuySellSort.relevance;
}

abstract final class BuySellData {
  static const categories = [
    BuySellCategory('Cars', 'cars',
        image: BuySellAssets.toyota, icon: Icons.directions_car_outlined),
    BuySellCategory('Mobiles', 'mobiles',
        image: BuySellAssets.iphoneGoldBox, icon: Icons.smartphone),
    BuySellCategory('Tablets', 'tablets',
        image: BuySellAssets.galaxyTab, icon: Icons.tablet_mac),
    BuySellCategory('Bikes', 'bikes', icon: Icons.two_wheeler),
    BuySellCategory('Laptops', 'laptops', icon: Icons.laptop_mac),
  ];

  /// Search page "Popular categories" → category key.
  static const popularCategories = [
    ('Mobiles', 'mobiles'),
    ('Computer accessories', 'laptops'),
    ('Used cars', 'cars'),
    ('Bikes', 'bikes'),
  ];

  static const _iphoneDetails = [
    ('Brand', 'Apple'),
    ('Condition', 'Used – Very Good'),
    ('Storage', '128 GB'),
    ('Display', '6.7-inch'),
    ('Camera', '48 MP Main Camera'),
    ('Battery Health', '90%'),
    ('Operating System', 'iOS'),
  ];

  static const toyota = BuySellListing(
    id: 'toyota-rav4',
    title: 'Toyota RAV4 SUV',
    fullTitle: 'Toyota RAV4 SUV - Hybrid - White',
    image: BuySellAssets.toyota,
    price: 112000,
    category: 'cars',
    isNew: true,
    featured: true,
    conditionDetail: 'New - Showroom condition',
    colorOptions: ['White', 'Grey', 'Black'],
    details: [
      ('Brand', 'Toyota'),
      ('Condition', 'New'),
      ('Fuel', 'Hybrid'),
      ('Transmission', 'Automatic'),
      ('Seats', '5'),
      ('Kilometers', '1,200 km'),
    ],
  );

  static const iphone15 = BuySellListing(
    id: 'iphone-15',
    title: 'I Phone 15',
    fullTitle: 'I Phone 15 pro max - 128 GB - Black',
    image: BuySellAssets.iphone15,
    price: 112000,
    category: 'mobiles',
    featured: true,
    memoryOptions: ['128 GB', '64 GB'],
    colorOptions: ['Black', 'Grey', 'White'],
    details: _iphoneDetails,
  );

  static const galaxyTab = BuySellListing(
    id: 'galaxy-tab',
    title: 'Galaxy Tab A9',
    fullTitle: 'Samsung Galaxy Tab A9 - 64 GB - Grey',
    image: BuySellAssets.galaxyTab,
    price: 18000,
    category: 'tablets',
    featured: true,
    memoryOptions: ['64 GB', '128 GB'],
    colorOptions: ['Grey', 'Silver'],
    details: [
      ('Brand', 'Samsung'),
      ('Condition', 'Used – Very Good'),
      ('Storage', '64 GB'),
      ('Display', '8.7-inch'),
      ('Battery Health', '92%'),
      ('Operating System', 'Android'),
    ],
  );

  static BuySellListing _iphone12(String id, String image, int price) =>
      BuySellListing(
        id: id,
        title: 'I Phone 12 pro max',
        fullTitle: 'I Phone 12 pro max - 128 GB - Pacific Blue',
        image: image,
        price: price,
        category: 'mobiles',
        memoryOptions: const ['128 GB', '256 GB'],
        colorOptions: const ['Blue', 'Gold', 'Silver'],
        details: const [
          ('Brand', 'Apple'),
          ('Condition', 'Used – Very Good'),
          ('Storage', '128 GB'),
          ('Display', '6.7-inch'),
          ('Camera', '12 MP Triple Camera'),
          ('Battery Health', '86%'),
          ('Operating System', 'iOS'),
        ],
      );

  static final listings = <BuySellListing>[
    toyota,
    iphone15,
    galaxyTab,
    _iphone12('iphone-12-blue', BuySellAssets.iphoneBlueHand, 112000),
    _iphone12('iphone-12-gold', BuySellAssets.iphoneGoldBox, 98000),
    _iphone12('iphone-12-silver', BuySellAssets.iphoneSilverHand, 95000),
    _iphone12('iphone-12-window', BuySellAssets.iphoneBlueWindow, 105000),
  ];

  static List<BuySellListing> get recommended =>
      [galaxyTab, toyota, iphone15, listings[4]];

  static List<BuySellListing> get recentlyViewed =>
      [toyota, listings[3], galaxyTab, listings[4]];

  static BuySellListing? byId(String id) {
    for (final l in listings) {
      if (l.id == id) return l;
    }
    return null;
  }

  static List<BuySellListing> search({
    String query = '',
    String? category,
    BuySellFilter filter = const BuySellFilter(),
  }) {
    final words = query
        .toLowerCase()
        .replaceAll('iphone', 'i phone')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    var list = listings.where((l) {
      if (category != null && l.category != category) return false;
      final hay = '${l.title} ${l.fullTitle} ${l.category}'.toLowerCase();
      return words.every(hay.contains);
    }).toList();

    // Loose match: show anything sharing a word rather than an empty page.
    if (list.isEmpty && words.isNotEmpty && category == null) {
      list = listings.where((l) {
        final hay = '${l.title} ${l.fullTitle} ${l.category}'.toLowerCase();
        return words.any((w) => w.length > 2 && hay.contains(w));
      }).toList();
    }

    list = list.where((l) {
      return switch (filter.condition) {
        BuySellCondition.newOnly => l.isNew,
        BuySellCondition.usedOnly => !l.isNew,
        BuySellCondition.all => true,
      };
    }).toList();

    switch (filter.sort) {
      case BuySellSort.priceLow:
        list.sort((a, b) => a.price.compareTo(b.price));
      case BuySellSort.priceHigh:
        list.sort((a, b) => b.price.compareTo(a.price));
      case BuySellSort.relevance:
        break;
    }
    return list;
  }
}

/// Liked listing ids.
final buySellFavoritesProvider = StateProvider<Set<String>>((ref) => {});

/// Recent search terms (newest first).
final buySellRecentSearchesProvider = StateProvider<List<String>>(
  (ref) => ['I Phone 12 pro max', 'Samsung tablet'],
);

/// Location picked from the Buy & Sell map; `null` → saved address.
final buySellLocationProvider = StateProvider<String?>((ref) => null);

/// Condition / sort from the filter sheet.
final buySellFilterProvider =
    StateProvider<BuySellFilter>((ref) => const BuySellFilter());

/// Adds [term] to the top of recent searches (deduped, max 6).
void rememberBuySellSearch(WidgetRef ref, String term) {
  final t = term.trim();
  if (t.isEmpty) return;
  final n = ref.read(buySellRecentSearchesProvider.notifier);
  n.state = [
    t,
    ...n.state.where((e) => e.toLowerCase() != t.toLowerCase()),
  ].take(6).toList();
}
