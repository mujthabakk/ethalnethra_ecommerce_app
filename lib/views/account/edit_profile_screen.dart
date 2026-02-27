import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import 'widgets/profile_edit_popups.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  String _selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Afsar Hossen');
    _emailController = TextEditingController(text: 'Imshuvo97@gmail.com');
    _mobileController = TextEditingController(text: '123456789');
    _passwordController = TextEditingController(text: '***********');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                _showOtpPopup('Email', 'abccd213@gmail.com');
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
            PopupTextField(hintText: '+91-${_mobileController.text}'),
            const PopupTextField(hintText: 'New Mobile Number'),
            const SizedBox(height: 10),
            PopupButton(
              label: 'Send OTP',
              onPressed: () {
                Navigator.pop(context);
                _showOtpPopup('Mobile Number', '+91-1234567889');
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

  void _showChangePasswordPopup() {
    showDialog(
      context: context,
      builder: (context) => ProfileEditPopup(
        child: Column(
          children: [
            const PopupTextField(hintText: 'Old Password', obscureText: true),
            const PopupTextField(hintText: 'New Password', obscureText: true),
            const PopupTextField(
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: PopupButton(
                    label: 'Reset',
                    backgroundColor: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PopupButton(
                    label: 'Submit',
                    backgroundColor: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Top Banner Image
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
                // Back Button
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
                // Profile Picture Circle
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

            // Name and Email
            ValueListenableBuilder(
              valueListenable: _nameController,
              builder: (context, value, child) {
                return Text(
                  _nameController.text,
                  style: AppTextStyles.accountName,
                );
              },
            ),
            const SizedBox(height: 5),
            ValueListenableBuilder(
              valueListenable: _emailController,
              builder: (context, value, child) {
                return Text(
                  _emailController.text,
                  style: AppTextStyles.accountEmail,
                );
              },
            ),

            const SizedBox(height: 40),

            // Form Fields
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
                  const SizedBox(height: 20),
                  _buildEditField(
                    label: 'Password',
                    controller: _passwordController,
                    showChange: true,
                    isPassword: true,
                    onTapChange: _showChangePasswordPopup,
                  ),
                  const SizedBox(height: 20),
                  _buildDropdownField(
                    label: 'Gender',
                    value: _selectedGender,
                    onChanged: (val) {
                      setState(() {
                        _selectedGender = val!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Update Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Profile updated successfully!"),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  elevation: 0,
                ),
                child: const Text(
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
    );
  }

  Widget _buildEditField({
    required String label,
    required TextEditingController controller,
    bool showChange = false,
    bool isUnderlined = false,
    bool isPassword = false,
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
            border: Border.all(color: const Color(0xFF7C7C7C).withOpacity(0.5)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
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

  Widget _buildDropdownField({
    required String label,
    required String value,
    required void Function(String?) onChanged,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF7C7C7C).withOpacity(0.5)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF7C7C7C),
              ),
              isExpanded: true,
              style: AppTextStyles.editProfileValue,
              onChanged: onChanged,
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
            ),
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
