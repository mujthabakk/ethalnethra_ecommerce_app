import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import 'v2_auth_colors.dart';
import 'v2_auth_shell.dart';
import 'v2_auth_widgets.dart';

/// V2 Create Account — Figma exact (centered title + glass fields).
class V2SignupScreen extends StatefulWidget {
  const V2SignupScreen({super.key});

  @override
  State<V2SignupScreen> createState() => _V2SignupScreenState();
}

class _V2SignupScreenState extends State<V2SignupScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  var _obscurePass = true;
  var _obscureConfirm = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Widget _eye({required bool obscure, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Icon(
          obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          size: 20,
          color: V2AuthUiColors.darkGreen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return V2AuthShell(
      showBack: true,
      title: 'Create Account',
      subtitle: 'Fill your information below to get started',
      cardPadding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          V2GlassField(
            label: 'Name',
            hint: 'Enter your name',
            controller: _name,
            prefixIcon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: 14),
          V2GlassField(
            label: 'E mail',
            hint: 'Enter your email',
            controller: _email,
            prefixIcon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 14),
          V2GlassField(
            label: 'Password',
            hint: 'Enter your password',
            controller: _pass,
            prefixIcon: Icons.lock_outline_rounded,
            obscure: _obscurePass,
            suffix: _eye(
              obscure: _obscurePass,
              onTap: () => setState(() => _obscurePass = !_obscurePass),
            ),
          ),
          const SizedBox(height: 14),
          V2GlassField(
            label: 'Confirm Password',
            hint: 'Confirm your password',
            controller: _confirm,
            prefixIcon: Icons.lock_outline_rounded,
            obscure: _obscureConfirm,
            suffix: _eye(
              obscure: _obscureConfirm,
              onTap: () => setState(() => _obscureConfirm = !_obscureConfirm),
            ),
          ),
          const SizedBox(height: 22),
          V2GradientCtaButton(
            label: 'Sign Up',
            onTap: () => context.go(AppRouter.v2Home),
          ),
          const SizedBox(height: 16),
          const V2SocialRow(),
          const SizedBox(height: 16),
          V2AuthFooterLink(
            prefix: 'Already have an account? ',
            action: 'Login',
            onTap: () => context.go(AppRouter.v2Login),
          ),
        ],
      ),
    );
  }
}
