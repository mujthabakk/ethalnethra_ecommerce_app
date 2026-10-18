import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/providers/main_nav_tab_provider.dart';
import '../../core/routes/app_router.dart';
import '../../core/storage/auth_storage.dart';
import '../../widgets/primary_button.dart';

/// Launch screen matching the welcome design (delivery hero + Get Started).
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var _checkingAuth = true;
  var _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap() async {
    final token = AuthStorage().token;
    final loggedIn = token != null && token.isNotEmpty;

    if (loggedIn) {
      await Future.delayed(const Duration(milliseconds: 1200));
      if (!mounted) return;
      resetMainNavToHome(ref);
      context.go(AppRouter.mainNav);
      return;
    }

    if (mounted) {
      setState(() {
        _isLoggedIn = false;
        _checkingAuth = false;
      });
    }
  }

  void _getStarted() {
    context.go(AppRouter.mobileNumber);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'asstes/images/welcome.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withValues(alpha: 0.8),
                      AppColors.darkBackground,
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.welcomeGradient,
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome',
                    style: AppTextStyles.welcomeTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'to our store',
                    style: AppTextStyles.welcomeTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Get your groceries in as fast as one hour',
                    style: AppTextStyles.welcomeSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  if (_checkingAuth || _isLoggedIn)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 90),
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  else ...[
                    PrimaryButton(
                      text: 'Get Started',
                      onPressed: _getStarted,
                    ),
                    const SizedBox(height: 90),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
