import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Real estate image paths under `asstes/v2desgin/service/real_easate/`.
abstract final class RealEstateAssets {
  static const String _base = 'asstes/v2desgin/service/real_easate';

  static const String avatar = '$_base/Ellipse 42.png';
  static const String featuredVilla = '$_base/Frame 7794.png';
  static const String houseDark = '$_base/Frame 7811.png';
  static const String houseGrey = '$_base/Frame 7812.png';
  static const String houseWhite = '$_base/Frame 7813.png';
  static const String villaPool = '$_base/Frame 7814.png';
  static const String apartment = '$_base/Frame 7815.png';

  static const String filter = '$_base/Group (5).png';
  static const String pinBlue = '$_base/Group (6).png';
  static const String bed = '$_base/Group (8).png';
  static const String pinGrey = '$_base/Group (9).png';
  static const String search = '$_base/Vector (6).png';
  static const String bath = '$_base/Vector (7).png';
  static const String area = '$_base/Vector (8).png';
}

enum DealType { rent, sale }

class NearbyLocality {
  const NearbyLocality(this.label, this.icon);

  final String label;
  final IconData icon;
}

class Property {
  const Property({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.price,
    required this.deal,
    required this.type,
    required this.beds,
    required this.baths,
    required this.sqft,
    this.rating = '4.3',
    this.reviews = 120,
    this.readyToMove = false,
    this.popular = false,
    this.isNew = false,
    this.gallery = const [],
    this.extraPhotos = 10,
    this.phone = '+918464000000',
    this.description = '',
    this.localities = defaultLocalities,
  });

  final String id;
  final String name;
  final String image;
  final String location;
  final int price;
  final DealType deal;

  /// Apartments / House / Villas.
  final String type;
  final int beds;
  final int baths;
  final int sqft;
  final String rating;
  final int reviews;
  final bool readyToMove;
  final bool popular;
  final bool isNew;

  /// Detail-page gallery (living, kitchen, bath, bedroom). `null` slots
  /// render a placeholder until the interior photos are added.
  final List<String?> gallery;
  final int extraPhotos;
  final String phone;
  final String description;
  final List<NearbyLocality> localities;

  bool get isRent => deal == DealType.rent;
  String get dealLabel => isRent ? 'For Rent' : 'For sale';
  String get typeLabel => switch (type) {
        'Villas' => 'Villa',
        'Apartments' => 'Apartment',
        _ => type,
      };
  String get priceLabel => '₹ ${formatInr(price)}';
  String get periodLabel => isRent ? '/month' : '';
  String get sqftLabel => '${formatInr(sqft)} sqft';

  static const defaultLocalities = [
    NearbyLocality('Hospital', Icons.local_hospital_outlined),
    NearbyLocality('Metro Station', Icons.directions_subway_outlined),
    NearbyLocality('School', Icons.school_outlined),
    NearbyLocality('Pharmacy', Icons.medication_outlined),
    NearbyLocality('Market', Icons.shopping_cart_outlined),
  ];
}

/// 12000 → "12,000"; 150000 → "1,50,000" (Indian grouping).
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

abstract final class RealEstateData {
  static const propertyTypes = ['Apartments', 'House', 'Villas', 'Ready to move'];
  static const nearbyFilters = ['All', 'Buy', 'Rent', 'Popular', 'Newly added'];

  static const _about =
      'Discover Palm Crest Villa, a beautiful home in the peaceful and '
      'well-connected locality of Westfort, Thrissur. Designed for '
      'comfortable family living, this villa offers a welcoming atmosphere '
      'with spacious interiors and a convenient location close to essential '
      'amenities. An ideal choice for those looking for a home that combines '
      'comfort, privacy, and everyday convenience.';

  static const _gallery = <String?>[null, null, null, null];

  static const featured = <Property>[
    Property(
      id: 'f1',
      name: 'Palm crest villa',
      image: RealEstateAssets.featuredVilla,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'Villas',
      beds: 4,
      baths: 3,
      sqft: 2450,
      popular: true,
      readyToMove: true,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'f2',
      name: 'Palm crest villa',
      image: RealEstateAssets.houseGrey,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'Villas',
      beds: 4,
      baths: 3,
      sqft: 2450,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'f3',
      name: 'Palm crest villa',
      image: RealEstateAssets.villaPool,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'Villas',
      beds: 4,
      baths: 3,
      sqft: 2450,
      isNew: true,
      gallery: _gallery,
      description: _about,
    ),
  ];

  static const nearby = <Property>[
    Property(
      id: 'n1',
      name: 'Bivid west',
      image: RealEstateAssets.featuredVilla,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'Villas',
      beds: 2,
      baths: 2,
      sqft: 2450,
      popular: true,
      readyToMove: true,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'n2',
      name: 'Bivid west',
      image: RealEstateAssets.houseDark,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'House',
      beds: 2,
      baths: 2,
      sqft: 2450,
      isNew: true,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'n3',
      name: 'Bivid west',
      image: RealEstateAssets.houseGrey,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'House',
      beds: 2,
      baths: 2,
      sqft: 1500,
      popular: true,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'n4',
      name: 'Bivid west',
      image: RealEstateAssets.houseWhite,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.sale,
      type: 'House',
      beds: 2,
      baths: 2,
      sqft: 1600,
      readyToMove: true,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'n5',
      name: 'Bivid west',
      image: RealEstateAssets.villaPool,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.rent,
      type: 'Villas',
      beds: 2,
      baths: 2,
      sqft: 2100,
      isNew: true,
      gallery: _gallery,
      description: _about,
    ),
    Property(
      id: 'n6',
      name: 'Bivid west',
      image: RealEstateAssets.apartment,
      location: 'West fort, Thrissur',
      price: 12000,
      deal: DealType.sale,
      type: 'Apartments',
      beds: 2,
      baths: 2,
      sqft: 1200,
      readyToMove: true,
      gallery: _gallery,
      description: _about,
    ),
  ];

  static bool matchesType(Property p, String? type) {
    if (type == null) return true;
    if (type == 'Ready to move') return p.readyToMove;
    return p.type == type;
  }

  static bool matchesNearby(Property p, String filter) => switch (filter) {
        'Buy' => p.deal == DealType.sale,
        'Rent' => p.deal == DealType.rent,
        'Popular' => p.popular,
        'Newly added' => p.isNew,
        _ => true,
      };

  static bool matchesQuery(Property p, String q) {
    final s = q.trim().toLowerCase();
    if (s.isEmpty) return true;
    return p.name.toLowerCase().contains(s) ||
        p.location.toLowerCase().contains(s) ||
        p.type.toLowerCase().contains(s);
  }
}

/// Liked property ids (heart toggle shared across real-estate screens).
final realEstateFavoritesProvider = StateProvider<Set<String>>((ref) => {});
