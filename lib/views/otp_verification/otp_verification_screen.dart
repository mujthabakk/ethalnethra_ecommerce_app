import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/providers/auth_providers.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';
import '../../core/utils/phone_utils.dart';
import '../../widgets/green_fab.dart';
import '../../widgets/otp_input.dart';

/// OTP Verification — resend and verify APIs; session saved on success.
class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  late final String _phone;
  String _otp = '';

  @override
  void initState() {
    super.initState();
    _phone = normalizeIndianPhone(widget.phoneNumber);
  }

  void _onOtpChanged(String otp) {
    setState(() {
      _otp = otp;
    });
  }

  /// Returning users with a saved delivery address go straight to the dashboard.
  Future<void> _navigateAfterSuccessfulVerify() async {
    try {
      final addresses =
          await ref.read(userProfileRepositoryProvider).fetchAddresses();
      if (!mounted) return;
      if (addresses.isNotEmpty) {
        ref.invalidate(userAddressesProvider);
        context.go(AppRouter.mainNav);
        return;
      }
    } catch (_) {
      // Fall through to location onboarding.
    }
    if (!mounted) return;
    context.go(AppRouter.location);
  }

  Future<void> _verifyAndNavigate({String? otpOverride}) async {
    final otp = otpOverride ?? _otp;
    if (otp.length != 4) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Enter the 4-digit code',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    final ok = await ref
        .read(verifyOtpNotifierProvider.notifier)
        .verify(phone: _phone, otp: otp);
    if (!mounted) return;
    if (ok) {
      await _navigateAfterSuccessfulVerify();
    } else {
      final err = ref.read(verifyOtpNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err ?? 'Verification failed',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  void _onOtpCompleted(String otp) {
    _verifyAndNavigate(otpOverride: otp);
  }

  Future<void> _resendCode() async {
    final ok =
        await ref.read(resendOtpNotifierProvider.notifier).resend(_phone);
    if (!mounted) return;
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Code resent to +91 $_phone',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } else {
      final err = ref.read(resendOtpNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err ?? 'Could not resend code',
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
    if (_otp.length < 4) {
      final newOtp = _otp + key;
      _onOtpChanged(newOtp);
      if (newOtp.length == 4) {
        _onOtpCompleted(newOtp);
      }
    }
  }

  void _onDelete() {
    if (_otp.isNotEmpty) {
      _onOtpChanged(_otp.substring(0, _otp.length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final verifyState = ref.watch(verifyOtpNotifierProvider);
    final resendState = ref.watch(resendOtpNotifierProvider);
    final fabLoading = verifyState.isLoading;

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
                          'Enter your 4-digit code',
                          style: AppTextStyles.heading1.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Code',
                          style: AppTextStyles.inputLabel.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),
                        OtpInput(
                          length: 4,
                          onChanged: _onOtpChanged,
                          onCompleted: _onOtpCompleted,
                          currentValue: _otp,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: resendState.isLoading ? null : _resendCode,
                            child: Text(
                              resendState.isLoading
                                  ? 'Sending…'
                                  : 'Resend Code',
                              style: AppTextStyles.link.copyWith(fontSize: 16),
                            ),
                          ),
                          GreenFab(
                            onPressed: () => _verifyAndNavigate(),
                            isLoading: fabLoading,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
