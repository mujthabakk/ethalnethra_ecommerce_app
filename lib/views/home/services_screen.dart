import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Landing page for home "Our Services" — banner + 2×2 service grid.
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static const _bannerBg = Color(0xFFE8F5E9);
  static const _titleGreen = Color(0xFF1B5E20);
  static const _cardBorder = Color(0xFF2E7D32);
  static const _cardFill = Color(0xFFE8F5E9);

  static const List<({String title, String imagePath})> _services = [
    (
      title: 'Mechanical Services',
      imagePath: 'asstes/images/Rectangle 86.png',
    ),
    (
      title: 'Plumbing Services',
      imagePath: 'asstes/images/Rectangle 87.png',
    ),
    (
      title: 'Electrical Services',
      imagePath: 'asstes/images/Rectangle 88.png',
    ),
    (
      title: 'Travel Services',
      imagePath: 'asstes/images/Rectangle 89.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF181725),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Services',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF181725),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                decoration: BoxDecoration(
                  color: _bannerBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Our services are launching shortly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _titleGreen,
                    height: 1.35,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.82,
                ),
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final s = _services[index];
                  return _ServiceCard(
                    title: s.title,
                    imagePath: s.imagePath,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${s.title} — coming soon'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ServicesScreen._cardFill,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ServicesScreen._cardBorder, width: 1.2),
          ),
          padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: ServicesScreen._titleGreen,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => ColoredBox(
                      color: ServicesScreen._bannerBg,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey.shade600,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
