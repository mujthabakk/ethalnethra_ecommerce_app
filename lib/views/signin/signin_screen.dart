import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_shimmer.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/user/user_details_models.dart';
import '../../core/providers/auth_providers.dart';
import '../../core/providers/location_user_providers.dart';
import '../../core/routes/app_router.dart';

const _changeLinkColor = Color(0xFFE8835E);

/// Personal details — GET/POST `/api/user/details` after address step.
class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _profileHydrated = false;
  bool _emailEditable = false;
  bool _phoneEditable = false;

  static const _fieldRadius = 14.0;

  InputDecoration _decoration(String label, {Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      suffixIcon: suffix,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: const BorderSide(color: Color(0xFFB1B1B1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: const BorderSide(color: Color(0xFFE2E2E2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final stored = ref.read(authStorageProvider).user;
    if (stored != null) {
      if (stored.name.isNotEmpty) {
        _nameController.text = stored.name;
      }
      if (stored.email.isNotEmpty) {
        _emailController.text = stored.email;
      }
      if (stored.phone.isNotEmpty) {
        _phoneController.text = stored.phone;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final ok = await ref.read(updateProfileNotifierProvider.notifier).submit(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
        );
    if (!mounted) return;
    if (ok) {
      context.go(AppRouter.mainNav);
    } else {
      final err = ref.read(updateProfileNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err ?? 'Update failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(userDetailsProvider);
    final updateState = ref.watch(updateProfileNotifierProvider);

    ref.listen(userDetailsProvider, (prev, next) {
      if (next.isLoading || _profileHydrated) return;
      _profileHydrated = true;
      next.whenOrNull(
        data: (u) {
          _nameController.text = u.displayName;
          if (u.email != null && u.email!.isNotEmpty) {
            _emailController.text = u.email!;
          }
          if (u.phone != null && u.phone!.isNotEmpty) {
            _phoneController.text = u.phone!;
          }
        },
      );
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8F4FC),
              Color(0xFFFDFDFE),
              Color(0xFFFFF0F5),
            ],
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (detailsAsync.isLoading && !_profileHydrated)
                    const ProfileHeaderShimmer(),
                  if (detailsAsync.hasError && _profileHydrated)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        'Could not load profile from server. You can still edit and submit.',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.orange.shade800,
                        ),
                      ),
                    ),
                  Text(
                    'Personal Details',
                    style: AppTextStyles.heading1.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your Basic Details',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    decoration: _decoration('Name'),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    readOnly: !_emailEditable,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: _decoration(
                      'Email',
                      suffix: TextButton(
                        onPressed: () {
                          setState(() => _emailEditable = true);
                        },
                        child: const Text(
                          'Change?',
                          style: TextStyle(
                            color: _changeLinkColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Enter email';
                      }
                      if (!v.contains('@')) return 'Invalid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _phoneController,
                    readOnly: !_phoneEditable,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    decoration: _decoration(
                      'Mobile',
                      suffix: TextButton(
                        onPressed: () {
                          setState(() => _phoneEditable = true);
                        },
                        child: const Text(
                          'Change?',
                          style: TextStyle(
                            color: _changeLinkColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Enter mobile number';
                      }
                      if (v.trim().length < 10) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed:
                          updateState.isLoading ? null : () => _submit(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: updateState.isLoading
                          ? const ShimmerButtonFill(
                              baseColor: Color(0xFF6BC48A),
                              highlightColor: AppColors.primary,
                              borderRadius: 14,
                            )
                          : const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
