import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/providers/auth_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/utils/phone_utils.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/green_fab.dart';

/// Mobile Number Screen — confirms/edits phone, then calls send-OTP API.
class MobileNumberScreen extends ConsumerStatefulWidget {
  const MobileNumberScreen({super.key, this.initialPhone = ''});

  /// Digits passed from sign-in (user can change via keypad).
  final String initialPhone;

  @override
  ConsumerState<MobileNumberScreen> createState() =>
      _MobileNumberScreenState();
}

class _MobileNumberScreenState extends ConsumerState<MobileNumberScreen> {
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialPhone.isNotEmpty) {
      _phoneController.text = widget.initialPhone;
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitAndGoToOtp() async {
    final phone = normalizeIndianPhone(_phoneController.text);
    if (phone.length < 10) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Enter a valid 10-digit mobile number',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    final ok =
        await ref.read(sendOtpNotifierProvider.notifier).send(phone);
    if (!mounted) return;
    if (ok) {
      context.push(AppRouter.otpVerification, extra: phone);
    } else {
      final err = ref.read(sendOtpNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err ?? 'Could not send OTP',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _onKeyTap(String key) {
    if (key.length != 1 || int.tryParse(key) == null) return;
    setState(() {
      _phoneController.text = _phoneController.text + key;
      _phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: _phoneController.text.length),
      );
    });
  }

  void _onDelete() {
    if (_phoneController.text.isNotEmpty) {
      setState(() {
        _phoneController.text = _phoneController.text.substring(
          0,
          _phoneController.text.length - 1,
        );
        _phoneController.selection = TextSelection.fromPosition(
          TextPosition(offset: _phoneController.text.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sendState = ref.watch(sendOtpNotifierProvider);

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
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Enter your mobile number',
                          style: AppTextStyles.heading1.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Mobile Number',
                          style: AppTextStyles.inputLabel.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.none,
                          autofocus: false,
                          showCursor: false,
                          readOnly: true,
                          hintText: '',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GreenFab(
                            onPressed: _submitAndGoToOtp,
                            isLoading: sendState.isLoading,
                          ),
                        ),
                      ),
                      CustomKeypad(onTab: _onKeyTap, onDelete: _onDelete),
                      const SizedBox(height: 20),
                    ],
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

class CustomKeypad extends StatelessWidget {
  final Function(String) onTab;
  final VoidCallback onDelete;

  const CustomKeypad({super.key, required this.onTab, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _buildRow(['1', '2', '3'], ['', 'ABC', 'DEF']),
          _buildRow(['4', '5', '6'], ['GHI', 'JKL', 'MNO']),
          _buildRow(['7', '8', '9'], ['PQRS', 'TUV', 'WXYZ']),
          _buildRow(['+ * #', '0', 'delete'], ['', '', '']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> labels, List<String> subLabels) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          final label = labels[index];
          final subLabel = subLabels[index];

          if (label == 'delete') {
            return _buildKey('', '', isDelete: true);
          }

          return _buildKey(label, subLabel);
        }),
      ),
    );
  }

  Widget _buildKey(String label, String subLabel, {bool isDelete = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: isDelete ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(8),
          elevation: isDelete ? 0 : 0.5,
          child: InkWell(
            onTap: isDelete ? onDelete : () => onTab(label),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDelete ? Colors.transparent : Colors.white,
                boxShadow: isDelete
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
              ),
              child: isDelete
                  ? const Icon(
                      Icons.backspace_outlined,
                      color: AppColors.darkBackground,
                      size: 24,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBackground,
                          ),
                        ),
                        if (subLabel.isNotEmpty)
                          Text(
                            subLabel,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBackground,
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
