import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/user/user_address_models.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/routes/app_router.dart';

/// Home app bar location line from the user's default delivery address.
class HomeLocationHeader extends ConsumerWidget {
  const HomeLocationHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressesAsync = ref.watch(userAddressesProvider);

    return GestureDetector(
      onTap: () => context.push(AppRouter.deliveryAddress),
      child: addressesAsync.when(
        loading: () => _locationRow(
          child: SizedBox(
            width: 120,
            height: 18,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        error: (_, __) => _locationRow(child: _locationLabel('Delivery address')),
        data: (addresses) {
          final addr = pickDefaultAddress(addresses);
          if (addr == null) {
            return _locationRow(child: _locationLabel('Add delivery address'));
          }

          if (addr.hasResolvedLocationNames) {
            return _locationRow(child: _locationLabel(addr.headerSummary()));
          }

          return _LocationHeaderFallback(addr: addr);
        },
      ),
    );
  }
}

/// Resolves zone/area labels from location APIs when the address payload has no names.
class _LocationHeaderFallback extends ConsumerWidget {
  const _LocationHeaderFallback({required this.addr});

  final UserAddressDto addr;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zonesAsync = ref.watch(zonesProvider);
    final zones = zonesAsync.valueOrNull ?? [];
    final zoneName = zones
        .where((z) => z.id == addr.zoneId)
        .map((z) => z.name)
        .firstOrNull;

    final zoneIdInt = int.tryParse(addr.zoneId);
    if (zoneIdInt == null) {
      return _locationRow(
        child: _locationLabel(addr.headerSummary(zoneName: zoneName)),
      );
    }

    final areasAsync = ref.watch(areasForZoneProvider(zoneIdInt));
    final text = areasAsync.when(
      data: (areas) {
        final areaName = areas
            .where((a) => a.id == addr.areaId)
            .map((a) => a.name)
            .firstOrNull;
        return addr.headerSummary(zoneName: zoneName, areaName: areaName);
      },
      loading: () => addr.headerSummary(zoneName: zoneName),
      error: (_, __) => addr.headerSummary(zoneName: zoneName),
    );

    return _locationRow(child: _locationLabel(text));
  }
}

Widget _locationRow({required Widget child}) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'asstes/images/location.png',
          width: 15,
          height: 18,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.location_on_outlined,
            size: 20,
            color: AppColors.darkBackground,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(child: child),
      ],
    ),
  );
}

Widget _locationLabel(String text) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.darkBackground,
    ),
  );
}
