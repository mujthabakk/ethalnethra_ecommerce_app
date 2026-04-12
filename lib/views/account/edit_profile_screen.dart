import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/user/user_details_models.dart';
import '../../core/providers/location_user_providers.dart';
import 'widgets/profile_edit_popups.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _mobileController;
  String? _lastUserSyncSig;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  /// Stable fingerprint so we re-fill when GET/POST returns new values (incl. `username` vs `name`).
  String _detailsSig(UserDetails d) {
    return '${d.id}|${d.name ?? ''}|${d.username ?? ''}|${d.email ?? ''}|${d.phone ?? ''}';
  }

  void _applyUserDetailsIfChanged(UserDetails d) {
    final sig = _detailsSig(d);
    if (_lastUserSyncSig == sig) return;
    _lastUserSyncSig = sig;
    _syncControllersFromDetails(d);
    if (mounted) setState(() {});
  }

  void _syncControllersFromDetails(UserDetails d) {
    // GET may return `name` and/or `username` (displayName prefers name, then username).
    _nameController.text = d.displayName;
    _emailController.text = d.email?.trim() ?? '';
    _mobileController.text = d.phone?.trim() ?? '';
  }

  void _showChangeEmailPopup() {
    showDialog(
      context: context,
      builder: (context) => ProfileEditPopup(
        child: Column(
          children: [
            PopupTextField(hintText: _emailController.text),
            const PopupTextField(hintText: 'New Email'),
            const SizedBox(height: 10),
            PopupButton(
              label: 'Send OTP',
              onPressed: () {
                Navigator.pop(context);
                _showOtpPopup('Email', _emailController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeMobilePopup() {
    showDialog(
      context: context,
      builder: (context) => ProfileEditPopup(
        child: Column(
          children: [
            PopupTextField(hintText: _mobileController.text),
            const PopupTextField(hintText: 'New Mobile Number'),
            const SizedBox(height: 10),
            PopupButton(
              label: 'Send OTP',
              onPressed: () {
                Navigator.pop(context);
                _showOtpPopup('Mobile Number', _mobileController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showOtpPopup(String type, String target) {
    showDialog(
      context: context,
      builder: (context) => ProfileEditPopup(
        child: Column(
          children: [
            Image.asset('asstes/images/email.png', width: 80, height: 80),
            const SizedBox(height: 20),
            Text(
              'Verify Your $type',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Please Enter The 4-digit code\nsent to $target',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 25),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [OtpField(), OtpField(), OtpField(), OtpField()],
            ),
            const SizedBox(height: 30),
            PopupButton(
              label: 'Verify',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitProfile() async {
    final ok = await ref
        .read(updateProfileNotifierProvider.notifier)
        .submit(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _mobileController.text.trim(),
        );
    if (!mounted) return;
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      final err = ref.read(updateProfileNotifierProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err ?? 'Update failed'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(userDetailsProvider);
    final updateState = ref.watch(updateProfileNotifierProvider);

    // ref.listen only runs on *changes*; cached AsyncData (e.g. after Account) never fired.
    // So also sync when watch() already has data, once per distinct payload.
    ref.listen<AsyncValue<UserDetails>>(userDetailsProvider, (previous, next) {
      next.whenData(_applyUserDetailsIfChanged);
    });
    detailsAsync.whenOrNull(
      data: (d) {
        if (_detailsSig(d) != _lastUserSyncSig) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            _applyUserDetailsIfChanged(d);
          });
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: detailsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Could not load profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text('$e', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(userDetailsProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (_) => SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asstes/images/edit_profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E2E2),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 70,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              ValueListenableBuilder(
                valueListenable: _nameController,
                builder: (context, value, child) {
                  return Text(
                    _nameController.text.isEmpty ? '—' : _nameController.text,
                    style: AppTextStyles.accountName,
                  );
                },
              ),
              const SizedBox(height: 5),
              ValueListenableBuilder(
                valueListenable: _emailController,
                builder: (context, value, child) {
                  return Text(
                    _emailController.text.isEmpty ? '—' : _emailController.text,
                    style: AppTextStyles.accountEmail,
                  );
                },
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    _buildEditField(label: 'Name', controller: _nameController),
                    const SizedBox(height: 20),
                    _buildEditField(
                      label: 'Email',
                      controller: _emailController,
                      showChange: true,
                      isUnderlined: true,
                      onTapChange: _showChangeEmailPopup,
                    ),
                    const SizedBox(height: 20),
                    _buildEditField(
                      label: 'Mobile',
                      controller: _mobileController,
                      showChange: true,
                      keyboardType: TextInputType.phone,
                      onTapChange: _showChangeMobilePopup,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: updateState.isLoading ? null : _submitProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 67),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    elevation: 0,
                  ),
                  child: updateState.isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Update Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditField({
    required String label,
    required TextEditingController controller,
    bool showChange = false,
    bool isUnderlined = false,
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onTapChange,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF7C7C7C).withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textAlignVertical: TextAlignVertical.center,
                  style: isUnderlined
                      ? AppTextStyles.editProfileValue.copyWith(
                          decoration: TextDecoration.underline,
                        )
                      : AppTextStyles.editProfileValue,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (showChange)
                GestureDetector(
                  onTap: onTapChange,
                  child: Text(
                    'Change?',
                    style: AppTextStyles.editProfileChangeLink,
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 25,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Text(label, style: AppTextStyles.editProfileInputLabel),
          ),
        ),
      ],
    );
  }
}
