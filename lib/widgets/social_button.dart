import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/widgets/app_shimmer.dart';

/// Social Button Type
enum SocialButtonType { google, facebook }

/// Social Login Button Widget
/// Used for Google and Facebook sign-in buttons
class SocialButton extends StatelessWidget {
  final SocialButtonType type;
  final VoidCallback? onPressed;
  final bool isLoading;

  const SocialButton({
    super.key,
    required this.type,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isGoogle = type == SocialButtonType.google;

    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isGoogle
              ? AppColors.googleBlue
              : AppColors.facebookBlue,
          foregroundColor: AppColors.white,
          elevation: 0,
          shadowColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: isLoading
            ? ShimmerButtonFill(
                baseColor: (isGoogle ? AppColors.googleBlue : AppColors.facebookBlue)
                    .withValues(alpha: 0.75),
                highlightColor:
                    isGoogle ? AppColors.googleBlue : AppColors.facebookBlue,
                borderRadius: 19,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        isGoogle ? 'G' : 'f',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isGoogle
                              ? AppColors.googleBlue
                              : AppColors.facebookBlue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Text
                  Text(
                    isGoogle
                        ? 'Continue with Google'
                        : 'Continue with Facebook',
                    style: AppTextStyles.buttonMedium,
                  ),
                ],
              ),
      ),
    );
  }
}
