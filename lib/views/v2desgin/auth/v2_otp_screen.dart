import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/providers/auth_providers.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/phone_utils.dart';
import 'v2_auth_colors.dart';
import 'v2_auth_shell.dart';
import 'v2_auth_widgets.dart';

/// V2 OTP — Figma exact (centered title + 4 glass boxes).
class V2OtpScreen extends ConsumerStatefulWidget {
  const V2OtpScreen({super.key, this.phoneDisplay = ''});

  final String phoneDisplay;

  @override
  ConsumerState<V2OtpScreen> createState() => _V2OtpScreenState();
}

class _V2OtpScreenState extends ConsumerState<V2OtpScreen> {
  final _ctrls = List.generate(4, (_) => TextEditingController());
  final _focus = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _ctrls) {
      c.dispose();
    }
    for (final f in _focus) {
      f.dispose();
    }
    super.dispose();
  }

  String get _phone => normalizeIndianPhone(widget.phoneDisplay);

  Future<void> _resend() async {
    if (_phone.length < 10) return;
    final ok = await ref.read(resendOtpNotifierProvider.notifier).resend(_phone);
    if (!mounted) return;
    final message = ok
        ? 'OTP sent again'
        : (ref.read(resendOtpNotifierProvider).errorMessage ?? 'Could not resend OTP');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _verify() async {
    final otp = _ctrls.map((c) => c.text).join();
    if (_phone.length < 10 || otp.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter the 4 digit code')),
      );
      return;
    }
    final ok = await ref.read(verifyOtpNotifierProvider.notifier).verify(
          phone: _phone,
          otp: otp,
        );
    if (!mounted) return;
    if (!ok) {
      final err = ref.read(verifyOtpNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err ?? 'Could not verify OTP')),
      );
      return;
    }
    final pending = ref.read(pendingSignupProvider);
    if (pending != null) {
      try {
        await ref.read(userProfileRepositoryProvider).updateUserDetails(
              name: pending.name,
              email: pending.email,
              phone: _phone,
            );
        ref.read(pendingSignupProvider.notifier).state = null;
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
    if (!mounted) return;
    context.go(AppRouter.selectLocation);
  }

  void _onChanged(int i, String v) {
    if (v.length == 1 && i < 3) {
      _focus[i + 1].requestFocus();
    } else if (v.isEmpty && i > 0) {
      _focus[i - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return V2AuthShell(
      showBack: true,
      title: 'Enter verification Code',
      subtitle:
          'Please enter the 4 digit code we just send to phone number ${widget.phoneDisplay}',
      cardPadding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (i) {
              return SizedBox(
                width: 62,
                height: 62,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withValues(alpha: 0.28),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.85),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: _ctrls[i],
                        focusNode: _focus[i],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: V2AuthUiColors.black,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: (v) => _onChanged(i, v),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 22),
          Text(
            "Didn't receive code ?",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: V2AuthUiColors.darkGreen,
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: _resend,
            child: Text(
              'Resend it',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: V2AuthUiColors.resendBrown,
                decoration: TextDecoration.underline,
                decorationColor: V2AuthUiColors.resendBrown,
              ),
            ),
          ),
          const SizedBox(height: 28),
          V2GradientCtaButton(
            label: 'Login',
            onTap: _verify,
          ),
          const SizedBox(height: 14),
          Text(
            'Your OTP will be read automatically',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: V2AuthUiColors.darkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
