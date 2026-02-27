import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Green Floating Action Button Widget
/// Used for next/submit actions on input screens
class GreenFab extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final double size;

  const GreenFab({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.size = 67,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        onPressed: isLoading ? null : onPressed,
        elevation: 0,
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.white,
                ),
              )
            : const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
                size: 24,
              ),
      ),
    );
  }
}
