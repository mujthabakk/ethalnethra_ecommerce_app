import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/user/user_address_models.dart';
import '../../../core/providers/auth_providers.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/routes/app_router.dart';
import 'service_assets.dart';
import 'service_data.dart';
import 'service_widgets.dart';

enum _PayMethod { online, cash, later }

/// Figma "Schedule Service" — issue, date/time, address, payment, confirm.
class ServiceScheduleScreen extends ConsumerStatefulWidget {
  const ServiceScheduleScreen({super.key, required this.provider});

  final ServiceProvider provider;

  @override
  ConsumerState<ServiceScheduleScreen> createState() =>
      _ServiceScheduleScreenState();
}

class _ServiceScheduleScreenState extends ConsumerState<ServiceScheduleScreen> {
  static const _slots = [
    '08:00 AM - 10:00 AM',
    '10:00 AM - 12:00 PM',
    '12:00 PM - 02:00 PM',
    '02:00 PM - 04:00 PM',
    '04:00 PM - 06:00 PM',
    '06:00 PM - 08:00 PM',
  ];
  static const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  final Set<int> _selectedIssues = {0};
  int _dateIndex = 0;
  String _slot = _slots[1];
  _PayMethod _pay = _PayMethod.online;
  bool _submitting = false;

  ServiceProvider get _p => widget.provider;

  List<DateTime> get _dates {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return List.generate(4, (i) => today.add(Duration(days: i)));
  }

  int get _total =>
      _selectedIssues.fold(0, (sum, i) => sum + _p.issues[i].price);

  int get _minutes =>
      _selectedIssues.fold(0, (sum, i) => sum + _p.issues[i].minutes);

  String get _durationLabel {
    final m = _minutes;
    if (m < 60) return '$m min';
    final h = m ~/ 60;
    final r = m % 60;
    return r == 0 ? '$h hr' : '$h hr $r min';
  }

  UserAddressDto? _address() {
    final token = ref.read(authStorageProvider).token;
    if (token == null || token.isEmpty) return null;
    final list =
        ref.watch(userAddressesProvider).value ?? const <UserAddressDto>[];
    if (list.isEmpty) return null;
    return list.firstWhere((a) => a.isDefault, orElse: () => list.first);
  }

  Future<void> _pickSlot() async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Choose Time Slot',
                style: servicePoppins(size: 16, weight: FontWeight.w500),
              ),
            ),
            for (final s in _slots)
              ListTile(
                title: Text(s, style: servicePoppins()),
                trailing: s == _slot
                    ? const Icon(Icons.check, color: ServiceColors.primary)
                    : null,
                onTap: () => Navigator.pop(context, s),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (picked != null) setState(() => _slot = picked);
  }

  Future<void> _confirm() async {
    if (_selectedIssues.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Select at least one service')),
        );
      return;
    }
    setState(() => _submitting = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _submitting = false);
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const BookingConfirmedDialog(),
    );
    if (!mounted) return;
    context.go(AppRouter.serviceHome);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;
    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const ServicePageHeader(title: 'Schedule Service'),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20, 4, 20, 24 + bottomPad),
                children: [
                  _buildProviderCard(),
                  const ServiceSectionTitle('What type of issue is this ?'),
                  _buildIssues(),
                  const ServiceSectionTitle('Choose Date & Time'),
                  _buildDates(),
                  const SizedBox(height: 18),
                  _buildSlot(),
                  const ServiceSectionTitle('Service Address'),
                  _buildAddress(),
                  const ServiceSectionTitle('Select Payment method'),
                  _buildPayment(),
                  const ServiceSectionTitle('Payment Details'),
                  _buildDetails(),
                  const SizedBox(height: 28),
                  _buildConfirmButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProviderCard() {
    return ServiceCard(
      padding: const EdgeInsets.all(14),
      radius: 10,
      child: Row(
        children: [
          Image.asset(
            _p.avatar,
            width: 66,
            height: 66,
            errorBuilder: (_, __, ___) =>
                const CircleAvatar(radius: 33, child: Icon(Icons.person)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _p.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: servicePoppins(size: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  _p.title,
                  style: servicePoppins(
                    size: 12,
                    color: ServiceColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const ServiceIcon(
                      ServiceAssets.starSmall,
                      size: 14,
                      fallback: Icons.star,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        '${_p.rating} (${_p.reviews}) | ',
                        style: servicePoppins(
                          size: 11,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: ServiceColors.textSecondary,
                    ),
                    const SizedBox(width: 2),
                    Flexible(
                      child: Text(
                        '${_p.distanceKm} km away',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: servicePoppins(
                          size: 11,
                          color: ServiceColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _ChangeButton(onTap: () => context.pop()),
        ],
      ),
    );
  }

  Widget _buildIssues() {
    return ServiceCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      radius: 10,
      child: Column(
        children: List.generate(_p.issues.length, (i) {
          final issue = _p.issues[i];
          final checked = _selectedIssues.contains(i);
          return Column(
            children: [
              InkWell(
                onTap: () => setState(() {
                  checked ? _selectedIssues.remove(i) : _selectedIssues.add(i);
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    children: [
                      _CheckBox(checked: checked),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(issue.title, style: servicePoppins(size: 16)),
                      ),
                      Text('₹ ${issue.price}', style: servicePoppins(size: 18)),
                    ],
                  ),
                ),
              ),
              if (i != _p.issues.length - 1)
                const Divider(height: 1, color: ServiceColors.divider),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDates() {
    final dates = _dates;
    return Row(
      children: List.generate(dates.length, (i) {
        final d = dates[i];
        final selected = i == _dateIndex;
        final top = i == 0 ? 'Today' : _weekdays[d.weekday - 1];
        final color = selected ? Colors.white : ServiceColors.textSecondary;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _dateIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: EdgeInsets.only(right: i == dates.length - 1 ? 0 : 14),
              height: 74,
              decoration: BoxDecoration(
                color: selected ? ServiceColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selected ? ServiceColors.primary : ServiceColors.border,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(top, style: servicePoppins(size: 14, color: color)),
                  const SizedBox(height: 4),
                  FittedBox(
                    child: Text(
                      '${d.day} ${_months[d.month - 1]}',
                      style: servicePoppins(size: 15, color: color),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSlot() {
    return GestureDetector(
      onTap: _pickSlot,
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ServiceColors.border),
        ),
        child: Row(
          children: [
            Expanded(child: Text(_slot, style: servicePoppins(size: 15))),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildAddress() {
    final address = _address();
    return ServiceCard(
      padding: const EdgeInsets.all(14),
      radius: 12,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: ServiceColors.addressChip,
              shape: BoxShape.circle,
            ),
            child: const ServiceIcon(
              ServiceAssets.addressPin,
              size: 20,
              fallback: Icons.location_on_outlined,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address?.label ?? 'Add address',
                  style: servicePoppins(size: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  address?.addressLine.trim().isNotEmpty == true
                      ? address!.addressLine.trim()
                      : 'Select a service location',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: servicePoppins(
                    size: 13,
                    color: ServiceColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          _ChangeButton(
            onTap: () => context.push(AppRouter.selectLocation),
          ),
        ],
      ),
    );
  }

  Widget _buildPayment() {
    final options = [
      (_PayMethod.online, ServiceAssets.card, Icons.credit_card, 'UPI / Card / Wallet'),
      (_PayMethod.cash, ServiceAssets.cash, Icons.payments_outlined, 'Cash on service completion'),
      (_PayMethod.later, ServiceAssets.payLater, Icons.schedule, 'Pay later'),
    ];
    return ServiceCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      radius: 12,
      child: Column(
        children: List.generate(options.length, (i) {
          final o = options[i];
          final selected = _pay == o.$1;
          return Column(
            children: [
              InkWell(
                onTap: () => setState(() => _pay = o.$1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: ServiceIcon(o.$2, size: 28, fallback: o.$3),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(o.$4, style: servicePoppins(size: 15)),
                      ),
                      _Radio(selected: selected),
                    ],
                  ),
                ),
              ),
              if (i != options.length - 1)
                const Divider(height: 1, color: ServiceColors.divider),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDetails() {
    final label = servicePoppins(size: 14, color: ServiceColors.textSecondary);
    final value = servicePoppins(size: 15, weight: FontWeight.w500);
    Widget row(String l, String v) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(child: Text(l, style: label)),
              Text(v, style: value),
            ],
          ),
        );
    return ServiceCard(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      radius: 12,
      child: Column(
        children: [
          row('Selected Service', '${_selectedIssues.length}'),
          row('Service Time', _selectedIssues.isEmpty ? '-' : _durationLabel),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: _DashedLine(),
          ),
          row('Total Price', '₹ $_total'),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Material(
      color: ServiceColors.primary,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _submitting ? null : _confirm,
        child: SizedBox(
          height: 56,
          child: Center(
            child: _submitting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Confirm Booking',
                        style: servicePoppins(size: 18, color: Colors.white),
                      ),
                      const SizedBox(width: 18),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _ChangeButton extends StatelessWidget {
  const _ChangeButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ServiceIcon(
              ServiceAssets.refresh,
              size: 22,
              fallback: Icons.sync,
            ),
            const SizedBox(height: 4),
            Text(
              'Change',
              style: servicePoppins(
                size: 13,
                weight: FontWeight.w500,
                color: ServiceColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox({required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: checked ? ServiceColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: ServiceColors.primary, width: 1.4),
      ),
      child: checked
          ? const Icon(Icons.check, size: 18, color: Colors.white)
          : null,
    );
  }
}

class _Radio extends StatelessWidget {
  const _Radio({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ServiceColors.primary, width: 1.4),
      ),
      child: selected
          ? const DecoratedBox(
              decoration: BoxDecoration(
                color: ServiceColors.primary,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}

class _DashedLine extends StatelessWidget {
  const _DashedLine();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        const dash = 10.0;
        const gap = 8.0;
        final count = (c.maxWidth / (dash + gap)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => Container(
              width: dash,
              height: 1,
              color: ServiceColors.divider,
            ),
          ),
        );
      },
    );
  }
}

/// Figma "Booking Confirmed !" popup.
class BookingConfirmedDialog extends StatelessWidget {
  const BookingConfirmedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.fromLTRB(24, 90, 24, 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Booking Confirmed !',
                  textAlign: TextAlign.center,
                  style: servicePoppins(size: 24, weight: FontWeight.w500),
                ),
                const SizedBox(height: 14),
                Text(
                  'Thank you for booking with Ethalnethra.\n'
                  'Your service provider will arrive as scheduled.',
                  textAlign: TextAlign.center,
                  style: servicePoppins(
                    size: 14,
                    color: ServiceColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: ServiceColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 64,
            ),
          ),
          Positioned(
            top: 70,
            right: 18,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
