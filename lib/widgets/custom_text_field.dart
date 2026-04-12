import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

/// Custom Text Field Widget
/// Used for input fields like phone number
class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? prefixText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool autofocus;
  final int? maxLength;
  final bool readOnly;
  final bool showCursor;

  const CustomTextField({
    super.key,
    this.label,
    this.hintText,
    this.prefixText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.focusNode,
    this.autofocus = false,
    this.maxLength,
    this.readOnly = false,
    this.showCursor = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: AppTextStyles.inputLabel),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          focusNode: focusNode,
          autofocus: autofocus,
          maxLength: maxLength,
          readOnly: readOnly,
          showCursor: showCursor,
          // Read-only + software keypad (e.g. TextInputType.none): long-press
          // would open the system context menu without a text input connection.
          enableInteractiveSelection: !readOnly,
          style: AppTextStyles.inputText,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.inputHint,
            prefixText: prefixText,
            prefixStyle: AppTextStyles.inputText,
            suffixIcon: suffixIcon,
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderGrey, width: 1),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderGrey, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
