import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_router.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/green_fab.dart';

/// Mobile Number Screen - Enter phone number for OTP
class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final _phoneController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _navigateToOtp() {
    if (_phoneController.text.isNotEmpty) {
      context.push(AppRouter.otpVerification, extra: _phoneController.text);
    }
  }

  void _onKeyTap(String key) {
    setState(() {
      _phoneController.text = _phoneController.text + key;
      // Move cursor to end
      _phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: _phoneController.text.length),
      );
    });
  }

  void _onDelete() {
    if (_phoneController.text.isNotEmpty) {
      setState(() {
        _phoneController.text = _phoneController.text.substring(
          0,
          _phoneController.text.length - 1,
        );
        _phoneController.selection = TextSelection.fromPosition(
          TextPosition(offset: _phoneController.text.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Top Background Image Pattern
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                'asstes/images/numbers_page_bg.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Bottom Background Image Pattern
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.15,
              child: Transform.rotate(
                angle: 3.14159,
                child: Image.asset(
                  'asstes/images/numbers_page_bg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Back Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.chevron_left,
                      color: AppColors.darkBackground,
                      size: 32,
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),

                        // Title
                        Text(
                          'Enter your mobile number',
                          style: AppTextStyles.heading1.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Mobile Number Label
                        Text(
                          'Mobile Number',
                          style: AppTextStyles.inputLabel.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Mobile Number Input - Simulated with TextField
                        CustomTextField(
                          controller: _phoneController,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.none,
                          autofocus: true,
                          showCursor: true,
                          readOnly: true,
                          hintText: '',
                        ),
                      ],
                    ),
                  ),
                ),

                // Button and Keypad Area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GreenFab(onPressed: _navigateToOtp),
                        ),
                      ),
                      CustomKeypad(onTab: _onKeyTap, onDelete: _onDelete),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomKeypad extends StatelessWidget {
  final Function(String) onTab;
  final VoidCallback onDelete;

  const CustomKeypad({super.key, required this.onTab, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _buildRow(['1', '2', '3'], ['', 'ABC', 'DEF']),
          _buildRow(['4', '5', '6'], ['GHI', 'JKL', 'MNO']),
          _buildRow(['7', '8', '9'], ['PQRS', 'TUV', 'WXYZ']),
          _buildRow(['+ * #', '0', 'delete'], ['', '', '']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> labels, List<String> subLabels) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          final label = labels[index];
          final subLabel = subLabels[index];

          if (label == 'delete') {
            return _buildKey('', '', isDelete: true);
          }

          return _buildKey(label, subLabel);
        }),
      ),
    );
  }

  Widget _buildKey(String label, String subLabel, {bool isDelete = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: isDelete ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(8),
          elevation: isDelete ? 0 : 0.5,
          child: InkWell(
            onTap: isDelete ? onDelete : () => onTab(label),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDelete ? Colors.transparent : Colors.white,
                boxShadow: isDelete
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
              ),
              child: isDelete
                  ? const Icon(
                      Icons.backspace_outlined,
                      color: AppColors.darkBackground,
                      size: 24,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBackground,
                          ),
                        ),
                        if (subLabel.isNotEmpty)
                          Text(
                            subLabel,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBackground,
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
