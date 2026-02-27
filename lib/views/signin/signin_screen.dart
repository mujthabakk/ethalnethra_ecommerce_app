import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';
import '../../widgets/phone_input_with_arrow.dart';
import '../../widgets/social_button.dart';

/// Sign In Screen - Phone number and social login
class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _navigateToMobileNumber() {
    context.push(AppRouter.mobileNumber);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image
            SizedBox(
              width: size.width,
              height: size.height * 0.45,
              child: Image.asset(
                'asstes/images/singin.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.inputBackground,
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 80,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  // Title
                  Text('Get your groceries', style: AppTextStyles.heading1),
                  Text('with nectar', style: AppTextStyles.heading1),

                  const SizedBox(height: 30),

                  // Phone Input with Arrow
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.borderGrey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: PhoneInputWithArrow(
                      controller: _phoneController,
                      onArrowPressed: _navigateToMobileNumber,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Or connect with social media
                  Center(
                    child: Text(
                      'Or connect with social media',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Google Button
                  // SocialButton(
                  //   type: SocialButtonType.google,
                  //   onPressed: () {
                  //     // Handle Google sign in
                  //   },
                  // ),

                  // const SizedBox(height: 16),

                  // Facebook Button
                  // SocialButton(
                  //   type: SocialButtonType.facebook,
                  //   onPressed: () {
                  //     // Handle Facebook sign in
                  //   },
                  // ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
