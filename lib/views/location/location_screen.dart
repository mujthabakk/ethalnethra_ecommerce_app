import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/location/area_item.dart';
import '../../core/models/location/pincode_item.dart';
import '../../core/models/location/zone_item.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/widgets/app_shimmer.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

/// Location — zones/areas from API, address POST, then personal details ([SigninScreen]).
class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  final _labelController = TextEditingController(text: 'Home');
  final _addressLineController = TextEditingController();

  String? _selectedZoneName;
  int? _selectedZoneId;
  String? _selectedAreaName;
  int? _selectedAreaId;
  String? _selectedPincodeId;

  bool _seededFirstZone = false;
  bool _pendingAreaSync = false;
  bool _pendingPincodeSync = false;

  @override
  void dispose() {
    _labelController.dispose();
    _addressLineController.dispose();
    super.dispose();
  }

  List<String> _zoneNames(List<ZoneItem> zones) =>
      zones.map((z) => z.name).toList();

  int? _zoneIdForName(List<ZoneItem> zones, String? name) {
    if (name == null) return null;
    for (final z in zones) {
      if (z.name == name) return int.tryParse(z.id);
    }
    return null;
  }

  int? _areaIdForName(List<AreaItem> areas, String? name) {
    if (name == null) return null;
    for (final a in areas) {
      if (a.name == name) return int.tryParse(a.id);
    }
    return null;
  }

  void _syncDefaultAreaIfNeeded(List<AreaItem> areas) {
    if (areas.isEmpty || !mounted) return;
    final valid = _selectedAreaName != null &&
        areas.any((a) => a.name == _selectedAreaName);
    if (valid || _pendingAreaSync) return;
    _pendingAreaSync = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pendingAreaSync = false;
      if (!mounted) return;
      setState(() {
        _selectedAreaName = areas.first.name;
        _selectedAreaId = int.tryParse(areas.first.id);
        _selectedPincodeId = null;
      });
    });
  }

  void _syncDefaultPincodeIfNeeded(List<PincodeItem> pincodes) {
    if (pincodes.isEmpty || !mounted) return;
    final valid = _selectedPincodeId != null &&
        pincodes.any((p) => p.id == _selectedPincodeId);
    if (valid || _pendingPincodeSync) return;
    _pendingPincodeSync = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pendingPincodeSync = false;
      if (!mounted) return;
      setState(() => _selectedPincodeId = pincodes.first.id);
    });
  }

  Future<void> _onSubmit(List<ZoneItem> zones) async {
    final zoneId = _selectedZoneId ?? _zoneIdForName(zones, _selectedZoneName);
    final addressLine = _addressLineController.text.trim();
    final pincodeId = _selectedPincodeId?.trim() ?? '';
    final label = _labelController.text.trim().isEmpty
        ? 'Home'
        : _labelController.text.trim();

    if (zoneId == null ||
        _selectedAreaId == null ||
        addressLine.isEmpty ||
        pincodeId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select zone, area, pincode and fill address',
          ),
        ),
      );
      return;
    }

    final ok = await ref.read(saveAddressNotifierProvider.notifier).submit(
          label: label,
          zoneId: zoneId,
          areaId: _selectedAreaId!,
          addressLine: addressLine,
          pincodeId: pincodeId,
        );
    if (!mounted) return;
    if (ok) {
      context.go(AppRouter.signin);
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
    final saveState = ref.watch(saveAddressNotifierProvider);

    ref.listen(zonesProvider, (prev, next) {
      if (!next.hasValue) return;
      final zones = next.requireValue;
      if (!_seededFirstZone &&
          zones.isNotEmpty &&
          _selectedZoneName == null &&
          mounted) {
        _seededFirstZone = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          setState(() {
            _selectedZoneName = zones.first.name;
            _selectedZoneId = int.tryParse(zones.first.id);
            _selectedAreaName = null;
            _selectedAreaId = null;
            _selectedPincodeId = null;
          });
        });
      }
    });

    final areasAsync = _selectedZoneId != null
        ? ref.watch(areasForZoneProvider(_selectedZoneId!))
        : const AsyncValue<List<AreaItem>>.data([]);

    final pincodesAsync = _selectedAreaId != null
        ? ref.watch(pincodesForAreaProvider(_selectedAreaId!))
        : const AsyncValue<List<PincodeItem>>.data([]);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                'asstes/images/numbers_page_bg.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.15,
              child: Transform.rotate(
                angle: 3.14159,
                child: Image.asset(
                  'asstes/images/numbers_page_bg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.chevron_left,
                        color: AppColors.darkBackground,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: zonesAsync.when(
                    loading: () => const LocationZonesShimmer(),
                    error: (e, _) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Could not load zones.\n$e',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    data: (zones) {
                      if (zones.isEmpty) {
                        return const Center(child: Text('No zones available'));
                      }

                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Image.asset(
                              'asstes/images/location.png',
                              width: 250,
                              height: 200,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.location_on_outlined,
                                size: 120,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Text(
                              'Select Your Location',
                              style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF181725),
                                height: 29 / 26,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Switch on your location to stay in tune with\n'
                              "what's happening in your area",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7C7C7C),
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            CustomDropdown(
                              label: 'Your Zone',
                              value: _selectedZoneName,
                              hint: 'Select your zone',
                              items: _zoneNames(zones),
                              onChanged: (value) {
                                setState(() {
                                  _pendingAreaSync = false;
                                  _selectedZoneName = value;
                                  _selectedZoneId =
                                      _zoneIdForName(zones, value);
                                  _selectedAreaName = null;
                                  _selectedAreaId = null;
                                  _selectedPincodeId = null;
                                  _pendingPincodeSync = false;
                                });
                              },
                            ),
                            const SizedBox(height: 24),
                            areasAsync.when(
                              loading: () => const AreaDropdownShimmer(),
                              error: (e, _) => Text(
                                'Areas: $e',
                                style: TextStyle(color: Colors.red.shade800),
                              ),
                              data: (areas) {
                                if (_selectedZoneId == null) {
                                  return const SizedBox.shrink();
                                }
                                if (areas.isEmpty) {
                                  return const Text('No areas for this zone');
                                }
                                _syncDefaultAreaIfNeeded(areas);
                                return CustomDropdown(
                                  key: ValueKey(_selectedZoneId),
                                  label: 'Your Area',
                                  value: _selectedAreaName,
                                  hint: 'Select your area',
                                  items: areas.map((a) => a.name).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAreaName = value;
                                      _selectedAreaId =
                                          _areaIdForName(areas, value);
                                      _selectedPincodeId = null;
                                      _pendingPincodeSync = false;
                                    });
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              label: 'Label',
                              controller: _labelController,
                              hintText: 'e.g. Home',
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              label: 'Address line',
                              controller: _addressLineController,
                              hintText: '123 Main St',
                            ),
                            const SizedBox(height: 16),
                            pincodesAsync.when(
                              loading: () => const AreaDropdownShimmer(),
                              error: (e, _) => Text(
                                'Pincodes: $e',
                                style: TextStyle(color: Colors.red.shade800),
                              ),
                              data: (pincodes) {
                                if (_selectedAreaId == null) {
                                  return const SizedBox.shrink();
                                }
                                if (pincodes.isEmpty) {
                                  return const Text(
                                    'No pincodes for this area',
                                  );
                                }
                                _syncDefaultPincodeIfNeeded(pincodes);
                                return CustomDropdown(
                                  key: ValueKey(_selectedAreaId),
                                  label: 'Pincode',
                                  value: _selectedPincodeId,
                                  hint: 'Select your pincode',
                                  items: pincodes.map((p) => p.id).toList(),
                                  itemLabels: {
                                    for (final p in pincodes) p.id: p.pincode,
                                  },
                                  onChanged: (value) {
                                    setState(() => _selectedPincodeId = value);
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                            PrimaryButton(
                              text: 'Submit',
                              isLoading: saveState.isLoading,
                              onPressed: () => _onSubmit(zones),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
