import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/user/user_address_models.dart';
import '../../../core/providers/auth_providers.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/routes/app_router.dart';
import '../v2_assets.dart';
import 'service_assets.dart';
import 'service_data.dart';
import 'service_widgets.dart';

/// Figma "Our Services" home — recommended carousel + all services grid.
class ServiceHomeScreen extends ConsumerStatefulWidget {
  const ServiceHomeScreen({super.key});

  @override
  ConsumerState<ServiceHomeScreen> createState() => _ServiceHomeScreenState();
}

class _ServiceHomeScreenState extends ConsumerState<ServiceHomeScreen> {
  final _pageController = PageController();
  final _searchController = TextEditingController();
  int _page = 0;
  String _query = '';

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  String _deliveryLabel() {
    final token = ref.read(authStorageProvider).token;
    if (token == null || token.isEmpty) return 'Select location';
    final list =
        ref.watch(userAddressesProvider).value ?? const <UserAddressDto>[];
    if (list.isEmpty) return 'Select location';
    final current = list.firstWhere(
      (item) => item.isDefault,
      orElse: () => list.first,
    );
    final line = current.addressLine.trim();
    return line.isEmpty ? current.label : '${current.label}, $line';
  }

  void _onServiceTab(int i) {
    if (i == 0) context.go(AppRouter.v2Home);
    if (i == 1) context.go(AppRouter.kistcherHome);
  }

  void _openCategory(String name) {
    if (name == 'Real Estate') {
      context.push(AppRouter.realEstateHome);
      return;
    }
    if (name == 'Buy & Sell') {
      context.push(AppRouter.buySellHome);
      return;
    }
    if (name == 'Spare Parts') {
      context.push(AppRouter.sparePartsHome);
      return;
    }
    context.push(AppRouter.serviceProviders, extra: name);
  }

  List<ServiceCategory> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return ServiceData.categories;
    return ServiceData.categories
        .where((c) => c.name.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;
    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _buildHeader()),
              SliverToBoxAdapter(child: _buildServiceTabs()),
              SliverToBoxAdapter(child: _buildSearch()),
              if (_query.trim().isEmpty) ...[
                SliverToBoxAdapter(child: _buildRecommendedTitle()),
                SliverToBoxAdapter(child: _buildCarousel()),
              ],
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  child: Text(
                    'All Services',
                    style: servicePoppins(size: 20, weight: FontWeight.w500),
                  ),
                ),
              ),
              if (items.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Center(
                      child: Text(
                        'No services found',
                        style: servicePoppins(
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  18,
                  0,
                  18,
                  24 + MediaQuery.paddingOf(context).bottom,
                ),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 22,
                    crossAxisSpacing: 22,
                    childAspectRatio: 177 / 179,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _ServiceTile(
                      category: items[i],
                      onTap: () => _openCategory(items[i].name),
                    ),
                    childCount: items.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Row(
        children: [
          ServiceCircleButton(
            size: 48,
            onTap: () => context.push(AppRouter.selectLocation),
            child: const ServiceIcon(
              ServiceAssets.locationPin,
              size: 22,
              fallback: Icons.location_on_outlined,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () => context.push(AppRouter.selectLocation),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery to',
                    style: servicePoppins(
                      size: 12,
                      color: ServiceColors.textSecondary,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          _deliveryLabel(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: servicePoppins(weight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              ServiceCircleButton(
                size: 46,
                onTap: () => context.push(AppRouter.v2Notifications),
                child: const ServiceIcon(
                  ServiceAssets.bell,
                  size: 18,
                  fallback: Icons.notifications_none_rounded,
                ),
              ),
              Positioned(
                right: 6,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE53935),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => context.push(AppRouter.v2Profile),
            child: ClipOval(
              child: Image.asset(
                ServiceAssets.avatar,
                width: 46,
                height: 46,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const CircleAvatar(
                  radius: 23,
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTabs() {
    const items = [
      (V2Assets.store, 'Ethalnethra mart'),
      (V2Assets.fastFood, 'Ethalnethra kitchen'),
      (V2Assets.customerService, 'Our Services'),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 22),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == 2;
          return Expanded(
            child: GestureDetector(
              onTap: () => _onServiceTab(i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected ? ServiceColors.primary : Colors.transparent,
                    width: 1.4,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      items[i].$1,
                      height: 52,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(Icons.store),
                    ),
                    const SizedBox(height: 10),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        items[i].$2,
                        maxLines: 1,
                        style: servicePoppins(size: 13, weight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const ServiceIcon(
                    ServiceAssets.search,
                    size: 18,
                    fallback: Icons.search,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _query = v),
                      textInputAction: TextInputAction.search,
                      style: servicePoppins(size: 15),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'Search Services',
                        hintStyle: servicePoppins(
                          size: 15,
                          weight: FontWeight.w300,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  if (_query.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _searchController.clear();
                        setState(() => _query = '');
                      },
                      child: const Icon(Icons.close, size: 18),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          ServiceCircleButton(
            size: 52,
            onTap: () => _openCategory('Services'),
            child: const ServiceIcon(
              ServiceAssets.filter,
              size: 22,
              fallback: Icons.tune,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 26, 22, 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Recommended for you',
              style: servicePoppins(size: 20, weight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: () => _openCategory('Services'),
            child: Text(
              'see all',
              style: servicePoppins(size: 15, color: ServiceColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    const items = ServiceData.recommended;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 376 / 185,
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _RecommendedCard(
                item: items[i],
                onTap: () => _openCategory(items[i].category),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (i) {
            final active = i == _page;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: active ? 22 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: active
                    ? ServiceColors.primary
                    : ServiceColors.primary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

/// Frosted-glass bottom bar shared by the banner and grid tiles.
class _GlassBar extends StatelessWidget {
  const _GlassBar({required this.child, required this.padding});

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.18),
                Colors.black.withValues(alpha: 0.22),
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard({required this.item, required this.onTap});

  final RecommendedService item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final white = servicePoppins(color: Colors.white);
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const ColoredBox(color: ServiceColors.addressChip),
            ),
            Positioned(
              left: 14,
              top: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: ServiceColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Recommended',
                  style: white.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _GlassBar(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: white.copyWith(fontSize: 16),
                          ),
                        ),
                        const ServiceIcon(
                          ServiceAssets.star,
                          size: 16,
                          fallback: Icons.star,
                          color: null,
                        ),
                        const SizedBox(width: 6),
                        Text(item.rating, style: white.copyWith(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const ServiceIcon(
                          ServiceAssets.clockWhite,
                          size: 14,
                          fallback: Icons.access_time,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(item.duration, style: white.copyWith(fontSize: 12)),
                        const Spacer(),
                        Text(item.priceRange, style: white.copyWith(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({required this.category, required this.onTap});

  final ServiceCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final placeholder = DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE6F1FC), Color(0xFFB9D4EE)],
        ),
      ),
      child: Align(
        alignment: const Alignment(0, -0.3),
        child: Icon(
          category.fallbackIcon,
          size: 56,
          color: ServiceColors.primary.withValues(alpha: 0.8),
        ),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (category.image != null)
                Image.asset(
                  category.image!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => placeholder,
                )
              else
                placeholder,
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _GlassBar(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: servicePoppins(size: 15, color: Colors.white),
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
