import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

/// Phone Input Widget with Country Code
/// Used in sign-in screen with +91 prefix and arrow button
class PhoneInputWithArrow extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onArrowPressed;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const PhoneInputWithArrow({
    super.key,
    this.controller,
    this.onArrowPressed,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Country Code
        Text('+91', style: AppTextStyles.inputText),
        const SizedBox(width: 8),
        // Phone Number Input
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.phone,
            onChanged: onChanged,
            style: AppTextStyles.inputText,
            cursorColor: AppColors.primary,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        // Arrow Button
        Container(
          width: 48,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onArrowPressed,
            icon: const Icon(
              Icons.arrow_forward,
              color: AppColors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
