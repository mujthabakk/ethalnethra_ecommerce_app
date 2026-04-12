import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';
import '../../widgets/primary_button.dart';

/// Welcome Screen - First onboarding screen with background image
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image - Full Screen
          Image.asset(
            'asstes/images/welcome.png',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) {
              // Fallback gradient if image not found
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

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.welcomeGradient,
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Title
                  Text(
                    'Welcome',
                    style: AppTextStyles.welcomeTitle,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),
                  Text(
                    'to our store',
                    style: AppTextStyles.welcomeTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Subtitle
                  Text(
                    'Get your groceries in as fast as one hour',
                    style: AppTextStyles.welcomeSubtitle,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Get Started Button
                  PrimaryButton(
                    text: 'Get Started',
                    onPressed: () {
                      context.push(AppRouter.mobileNumber, extra: '');
                    },
                  ),

                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
