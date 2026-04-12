import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

/// OTP Input Widget
/// Used for 4-digit OTP verification
class OtpInput extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final String? currentValue;

  const OtpInput({
    super.key,
    this.length = 4,
    this.onCompleted,
    this.onChanged,
    this.currentValue,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late String _otp;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _otp = widget.currentValue ?? '';
    _updateControllers();
  }

  @override
  void didUpdateWidget(OtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentValue != oldWidget.currentValue) {
      _otp = widget.currentValue ?? '';
      _updateControllers();
    }
  }

  void _updateControllers() {
    for (int i = 0; i < widget.length; i++) {
      if (i < _otp.length) {
        _controllers[i].text = _otp[i];
      } else {
        _controllers[i].text = '';
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length == 1) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    _otp = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(_otp);

    if (_otp.length == widget.length) {
      widget.onCompleted?.call(_otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.length, (index) {
        return Container(
          width: 40,
          margin: EdgeInsets.only(right: index < widget.length - 1 ? 16 : 0),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.none, // Disable system keyboard
            readOnly: true, // Use custom keypad
            enableInteractiveSelection: false,
            textAlign: TextAlign.center,
            maxLength: 1,
            autofocus: false,
            showCursor: false,
            style: AppTextStyles.inputText.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              counterText: '',
              hintText: '-',
              hintStyle: AppTextStyles.inputHint.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
            onChanged: (value) => _onChanged(index, value),
          ),
        );
      }),
    );
  }
}
