/// Spare parts image paths under `asstes/v2desgin/service/Spare_parts_page/`.
abstract final class SparePartsAssets {
  static const String _base = 'asstes/v2desgin/service/Spare_parts_page';

  static const String engine = '$_base/image-Photoroom (56) 1.png';
  static const String shockAbsorber = '$_base/image-Photoroom (57) 1.png';
  static const String rollChain = '$_base/image-Photoroom (57) 1 (1).png';
  static const String rodKnock = '$_base/image-Photoroom (57) 1 (2).png';
  static const String headlight = '$_base/image-Photoroom (57) 1 (3).png';
  static const String clutchKit = '$_base/image-Photoroom (60) 1.png';

  static const String filter = '$_base/Group (11).png';
  static const String thermometer = '$_base/Group 6994.png';
  static const String star = '$_base/Star 2 (2).png';
  static const String phone = '$_base/Vector (9).png';
  static const String bolt = '$_base/Vector (10).png';
  static const String wrench = '$_base/Vector (11).png';
  static const String fuel = '$_base/Vector (12).png';
}

/// One gauge tile in "Specifications" (65 % · Fuel level).
class PartSpec {
  const PartSpec({
    required this.value,
    required this.unit,
    required this.label,
    required this.icon,
    required this.progress,
  });

  final String value;
  final String unit;
  final String label;
  final String icon;

  /// 0–1 fill of the yellow bar.
  final double progress;
}

class SparePart {
  const SparePart({
    required this.id,
    required this.name,
    required this.category,
    required this.chip,
    required this.image,
    required this.price,
    required this.description,
    required this.specs,
    this.model = '',
    this.rating = '4.3',
    this.reviews = 120,
    this.galleryCount = 1,
    this.phone = '+918464000000',
  });

  final String id;

  /// Full name, e.g. "BMW 702 Engine".
  final String name;

  /// Search-page category ("Engines", "Shock absorber"…).
  final String category;

  /// Home filter chip ("Engine", "Brakes"…).
  final String chip;
  final String image;
  final int price;
  final String description;
  final List<PartSpec> specs;

  /// Banner title, e.g. "BMW 702".
  final String model;
  final String rating;
  final int reviews;
  final int galleryCount;
  final String phone;

  String get priceLabel => '₹ $price';
  String get bannerTitle => model.isEmpty ? name : model;
}

/// Search-page category card.
class PartCategory {
  const PartCategory(this.name, this.image);

  final String name;
  final String image;
}

abstract final class SparePartsData {
  static const chips = ['All', 'Engine', 'Brakes', 'Drills', 'Generator'];

  static const categories = [
    PartCategory('Shock absorber', SparePartsAssets.shockAbsorber),
    PartCategory('Engines', SparePartsAssets.engine),
    PartCategory('Roll Chains', SparePartsAssets.rollChain),
    PartCategory('Head lights', SparePartsAssets.headlight),
    PartCategory('Rod knocks', SparePartsAssets.rodKnock),
    PartCategory('Clutch kit', SparePartsAssets.clutchKit),
  ];

  static const engine = SparePart(
    id: 'engine-bmw-702',
    name: 'BMW 702 Engine',
    model: 'BMW 702',
    galleryCount: 3,
    category: 'Engines',
    chip: 'Engine',
    image: SparePartsAssets.engine,
    price: 250,
    description:
        'The BMW 702 Engine delivers reliable performance and powerful engine '
        'efficiency, making it a suitable choice for vehicle maintenance and '
        'replacement needs. Designed for durability and smooth operation, it '
        'offers dependable performance for everyday driving.',
    specs: [
      PartSpec(
        value: '65',
        unit: '%',
        label: 'Fuel level',
        icon: SparePartsAssets.fuel,
        progress: 0.65,
      ),
      PartSpec(
        value: '250',
        unit: 'HP',
        label: 'Engine power',
        icon: SparePartsAssets.bolt,
        progress: 0.65,
      ),
      PartSpec(
        value: '95',
        unit: 'c',
        label: 'Oil Temp',
        icon: SparePartsAssets.thermometer,
        progress: 0.65,
      ),
      PartSpec(
        value: '210',
        unit: 'Nm',
        label: 'Max Torque',
        icon: SparePartsAssets.wrench,
        progress: 0.65,
      ),
    ],
  );

  static const _wearSpecs = [
    PartSpec(
      value: '80',
      unit: '%',
      label: 'Condition',
      icon: SparePartsAssets.wrench,
      progress: 0.8,
    ),
    PartSpec(
      value: '120',
      unit: 'kg',
      label: 'Load capacity',
      icon: SparePartsAssets.bolt,
      progress: 0.6,
    ),
    PartSpec(
      value: '70',
      unit: 'c',
      label: 'Max Temp',
      icon: SparePartsAssets.thermometer,
      progress: 0.55,
    ),
    PartSpec(
      value: '2',
      unit: 'yr',
      label: 'Warranty',
      icon: SparePartsAssets.fuel,
      progress: 0.4,
    ),
  ];

  static const parts = <SparePart>[
    SparePart(
      id: 'shock-absorber',
      name: 'Shock absorber',
      category: 'Shock absorber',
      chip: 'Suspension',
      image: SparePartsAssets.shockAbsorber,
      price: 500,
      description:
          'A heavy-duty shock absorber that keeps your ride smooth and stable '
          'on rough roads. Built with a hardened spring and sealed damper for '
          'long life and consistent handling.',
      specs: _wearSpecs,
    ),
    SparePart(
      id: 'roll-chain',
      name: 'Roll Chain',
      category: 'Roll Chains',
      chip: 'Drive',
      image: SparePartsAssets.rollChain,
      price: 500,
      description:
          'High-tensile roller chain for smooth, quiet power transfer. '
          'Precision links resist stretch and wear for dependable everyday use.',
      specs: _wearSpecs,
    ),
    SparePart(
      id: 'rod-knock',
      name: 'Rod Knock',
      category: 'Rod knocks',
      chip: 'Engine',
      image: SparePartsAssets.rodKnock,
      price: 500,
      description:
          'Complete piston and connecting-rod assembly to fix rod knock and '
          'restore smooth, quiet engine running.',
      specs: _wearSpecs,
    ),
    SparePart(
      id: 'car-headlight',
      name: 'Car headlight',
      category: 'Head lights',
      chip: 'Lights',
      image: SparePartsAssets.headlight,
      price: 500,
      description:
          'Clear-lens headlight pair with chrome reflectors for a bright, '
          'wide beam. Direct-fit replacement for easy installation.',
      specs: _wearSpecs,
    ),
    engine,
    SparePart(
      id: 'clutch-kit',
      name: 'Clutch kit',
      category: 'Clutch kit',
      chip: 'Engine',
      image: SparePartsAssets.clutchKit,
      price: 500,
      description:
          'Full clutch kit with flywheel, pressure plate and friction disc for '
          'smooth gear changes and reliable engagement.',
      specs: _wearSpecs,
    ),
  ];

  static List<SparePart> byChip(String chip) =>
      chip == 'All' ? parts : parts.where((p) => p.chip == chip).toList();

  static List<SparePart> byCategory(String category) =>
      parts.where((p) => p.category == category).toList();

  static List<SparePart> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return parts;
    return parts
        .where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.category.toLowerCase().contains(q) ||
              p.chip.toLowerCase().contains(q),
        )
        .toList();
  }
}
