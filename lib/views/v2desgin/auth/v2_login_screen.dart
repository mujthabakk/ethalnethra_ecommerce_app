import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/providers/auth_providers.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/phone_utils.dart';
import 'v2_auth_colors.dart';
import 'v2_auth_shell.dart';
import 'v2_auth_widgets.dart';

/// V2 Login — Figma exact (centered title + glass card).
class V2LoginScreen extends ConsumerStatefulWidget {
  const V2LoginScreen({super.key});

  @override
  ConsumerState<V2LoginScreen> createState() => _V2LoginScreenState();
}

class _V2LoginScreenState extends ConsumerState<V2LoginScreen> {
  var _isEmail = false;
  var _obscure = true;
  var _remember = false;

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign in with your phone number to receive an OTP'),
        ),
      );
      setState(() => _isEmail = false);
      return;
    }
    final phone = normalizeIndianPhone(_phoneCtrl.text);
    if (phone.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit mobile number')),
      );
      return;
    }
    final ok = await ref.read(sendOtpNotifierProvider.notifier).send(phone);
    if (!mounted) return;
    if (!ok) {
      final err = ref.read(sendOtpNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err ?? 'Could not send OTP')),
      );
      return;
    }
    context.push(AppRouter.v2Otp, extra: phone);
  }

  @override
  Widget build(BuildContext context) {
    return V2AuthShell(
      title: 'Welcome back !',
      subtitle: 'Compare prices, save more, shop smarter.',
      cardPadding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          V2AuthTabSwitch(
            isEmail: _isEmail,
            onChanged: (v) => setState(() => _isEmail = v),
          ),
          const SizedBox(height: 20),
          if (_isEmail) ...[
            V2GlassField(
              label: 'E mail',
              hint: 'Enter your email',
              controller: _emailCtrl,
              prefixIcon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 14),
            V2GlassField(
              label: 'Password',
              hint: 'Enter your password',
              controller: _passwordCtrl,
              prefixIcon: Icons.lock_outline_rounded,
              obscure: _obscure,
              suffix: GestureDetector(
                onTap: () => setState(() => _obscure = !_obscure),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    _obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20,
                    color: V2AuthUiColors.darkGreen,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            V2RememberRow(
              value: _remember,
              onChanged: (v) => setState(() => _remember = v),
            ),
            const SizedBox(height: 20),
            V2GradientCtaButton(label: 'Login', onTap: _submit),
            const SizedBox(height: 16),
            const V2SocialRow(),
            const SizedBox(height: 16),
            V2AuthFooterLink(
              prefix: "Don't have an account ? ",
              action: 'Sign Up',
              onTap: () => context.push(AppRouter.v2Signup),
            ),
          ] else ...[
            V2GlassField(
              label: 'Phone Number',
              hint: 'Enter your number',
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black26),
                      color: Colors.orange.shade100,
                    ),
                    alignment: Alignment.center,
                    child: const Text('🇮🇳', style: TextStyle(fontSize: 11)),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '+ 91',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: V2AuthUiColors.black,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                  Container(
                    width: 1,
                    height: 22,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            V2GradientCtaButton(label: 'Get OTP', onTap: _submit),
            const SizedBox(height: 22),
            V2AuthFooterLink(
              prefix: "Don't have an account ? ",
              action: 'Sign Up',
              onTap: () => context.push(AppRouter.v2Signup),
            ),
          ],
        ],
      ),
    );
  }
}
