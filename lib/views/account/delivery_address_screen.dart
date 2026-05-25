import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/location/area_item.dart';
import '../../core/models/location/pincode_item.dart';
import '../../core/models/user/user_address_models.dart';
import '../../core/providers/location_user_providers.dart';

class DeliveryAddressScreen extends ConsumerWidget {
  const DeliveryAddressScreen({super.key});

  static IconData _iconForLabel(String label) {
    final l = label.toLowerCase();
    if (l.contains('home')) return Icons.home;
    if (l.contains('work') || l.contains('office')) return Icons.work;
    return Icons.place_outlined;
  }

  void _openFormSheet(BuildContext context, {UserAddressDto? address}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _AddressFormSheet(address: address),
    );
  }

  Future<void> _setDefault(
    BuildContext context,
    WidgetRef ref,
    UserAddressDto address,
  ) async {
    final ok = await ref
        .read(saveAddressNotifierProvider.notifier)
        .setDefaultAddress(address.id);
    if (!context.mounted) return;
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Default address updated')),
      );
    } else {
      final err = ref.read(saveAddressNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err ?? 'Could not set default address')),
      );
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    UserAddressDto address,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete address'),
        content: Text(
          'Remove "${address.label}" from your saved addresses?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final ok = await ref
        .read(saveAddressNotifierProvider.notifier)
        .deleteAddress(address.id);
    if (!context.mounted) return;
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address deleted')),
      );
    } else {
      final err = ref.read(saveAddressNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err ?? 'Could not delete address')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressesAsync = ref.watch(userAddressesProvider);
    final actionState = ref.watch(saveAddressNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF181725),
            size: 30,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text('My Addresses', style: AppTextStyles.orderHistoryTitle),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(userAddressesProvider);
          await ref.read(userAddressesProvider.future);
        },
        child: addressesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'Could not load addresses',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('$e', textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => ref.invalidate(userAddressesProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          data: (addresses) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              children: [
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: actionState.isLoading
                      ? null
                      : () => _openFormSheet(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE2E2E2)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Color(0xFFF3603F),
                          size: 24,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Add New Address',
                          style: AppTextStyles.addNewAddressButtonText,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFF3603F),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'SAVED ADDRESSES',
                  style: AppTextStyles.addressSectionHeader,
                ),
                const SizedBox(height: 20),
                if (addresses.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      'No saved addresses yet.',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  )
                else
                  ...addresses.map(
                    (a) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: _AddressCard(
                        address: a,
                        icon: _iconForLabel(a.label),
                        actionsEnabled: !actionState.isLoading,
                        onEdit: () => _openFormSheet(context, address: a),
                        onSetDefault: a.isDefault
                            ? null
                            : () => _setDefault(context, ref, a),
                        onDelete: () => _confirmDelete(context, ref, a),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  const _AddressCard({
    required this.address,
    required this.icon,
    required this.actionsEnabled,
    required this.onEdit,
    required this.onDelete,
    this.onSetDefault,
  });

  final UserAddressDto address;
  final IconData icon;
  final bool actionsEnabled;
  final VoidCallback onEdit;
  final VoidCallback? onSetDefault;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: AppColors.darkBackground, size: 28),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            address.label.toUpperCase(),
                            style: AppTextStyles.orderItemTitle,
                          ),
                        ),
                        if (address.isDefault)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'Default',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      address.displayLines,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF181725),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              if (onSetDefault != null)
                TextButton(
                  onPressed: actionsEnabled ? onSetDefault : null,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Set as default'),
                ),
              TextButton(
                onPressed: actionsEnabled ? onEdit : null,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF181725),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Edit'),
              ),
              TextButton(
                onPressed: actionsEnabled ? onDelete : null,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddressFormSheet extends ConsumerStatefulWidget {
  const _AddressFormSheet({this.address});

  final UserAddressDto? address;

  bool get isEditing => address != null;

  @override
  ConsumerState<_AddressFormSheet> createState() => _AddressFormSheetState();
}

class _AddressFormSheetState extends ConsumerState<_AddressFormSheet> {
  late final TextEditingController _label;
  late final TextEditingController _line;
  String? _zoneId;
  String? _areaId;
  String? _pincodeId;
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    final a = widget.address;
    _label = TextEditingController(text: a?.label ?? '');
    _line = TextEditingController(text: a?.addressLine ?? '');
    _zoneId = a?.zoneId;
    _areaId = a?.areaId;
    _pincodeId = a?.pincodeId?.toString() ??
        (int.tryParse(a?.pincode ?? '') != null ? a!.pincode : null);
    _isDefault = a?.isDefault ?? false;
  }

  @override
  void dispose() {
    _label.dispose();
    _line.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final z = int.tryParse(_zoneId ?? '');
    final a = int.tryParse(_areaId ?? '');
    if (z == null || a == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select zone and area')),
      );
      return;
    }
    if (_label.text.trim().isEmpty || _line.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter label and address')),
      );
      return;
    }
    if (_pincodeId == null || _pincodeId!.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select pincode')),
      );
      return;
    }

    final ok = await ref.read(saveAddressNotifierProvider.notifier).submit(
          label: _label.text.trim(),
          zoneId: z,
          areaId: a,
          addressLine: _line.text.trim(),
          pincodeId: _pincodeId!.trim(),
          addressId: widget.address?.id,
          isDefault: widget.isEditing ? false : _isDefault,
        );

    if (!mounted) return;
    if (ok) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isEditing ? 'Address updated' : 'Address saved',
          ),
        ),
      );
    } else {
      final err = ref.read(saveAddressNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err ?? 'Could not save address')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final zonesAsync = ref.watch(zonesProvider);
    final zoneKey = int.tryParse(_zoneId ?? '') ?? 0;
    final areasAsync = _zoneId != null && zoneKey > 0
        ? ref.watch(areasForZoneProvider(zoneKey))
        : const AsyncValue<List<AreaItem>>.data([]);

    final areaKey = int.tryParse(_areaId ?? '') ?? 0;
    final pincodesAsync = _areaId != null && areaKey > 0
        ? ref.watch(pincodesForAreaProvider(areaKey))
        : const AsyncValue<List<PincodeItem>>.data([]);

    final save = ref.watch(saveAddressNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.isEditing ? 'Edit address' : 'Add address',
              style: AppTextStyles.orderHistoryTitle,
            ),
            const SizedBox(height: 16),
            zonesAsync.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (e, _) => Text('$e'),
              data: (zones) {
                return InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Zone',
                    border: OutlineInputBorder(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select zone'),
                      value: _zoneId != null &&
                              zones.any((z) => z.id == _zoneId)
                          ? _zoneId
                          : null,
                      items: zones
                          .map(
                            (z) => DropdownMenuItem(
                              value: z.id,
                              child: Text(
                                z.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() {
                        _zoneId = v;
                        _areaId = null;
                        _pincodeId = null;
                      }),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            areasAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Text('$e'),
              data: (areas) {
                if (_zoneId == null) {
                  return Text(
                    'Choose a zone to load areas',
                    style: TextStyle(color: Colors.grey.shade600),
                  );
                }
                return InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Area',
                    border: OutlineInputBorder(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select area'),
                      value: _areaId != null &&
                              areas.any((a) => a.id == _areaId)
                          ? _areaId
                          : null,
                      items: areas
                          .map(
                            (a) => DropdownMenuItem(
                              value: a.id,
                              child: Text(
                                a.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() {
                        _areaId = v;
                        _pincodeId = null;
                      }),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _label,
              decoration: const InputDecoration(
                labelText: 'Label (e.g. Home)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _line,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Address line',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            pincodesAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Text('$e'),
              data: (pincodes) {
                if (_areaId == null) {
                  return Text(
                    'Choose an area to load pincodes',
                    style: TextStyle(color: Colors.grey.shade600),
                  );
                }
                if (pincodes.isEmpty) {
                  return Text(
                    'No pincodes for this area',
                    style: TextStyle(color: Colors.grey.shade600),
                  );
                }
                return InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Pincode',
                    border: OutlineInputBorder(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select pincode'),
                      value: _pincodeId != null &&
                              pincodes.any((p) => p.id == _pincodeId)
                          ? _pincodeId
                          : null,
                      items: pincodes
                          .map(
                            (p) => DropdownMenuItem(
                              value: p.id,
                              child: Text(p.pincode),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _pincodeId = v),
                    ),
                  ),
                );
              },
            ),
            if (!widget.isEditing) ...[
              const SizedBox(height: 12),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Set as default address'),
                value: _isDefault,
                activeThumbColor: AppColors.primary,
                onChanged: (v) => setState(() => _isDefault = v),
              ),
            ],
            const SizedBox(height: 20),
            FilledButton(
              onPressed: save.isLoading ? null : _save,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: save.isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(widget.isEditing ? 'Update address' : 'Save address'),
            ),
          ],
        ),
      ),
    );
  }
}
