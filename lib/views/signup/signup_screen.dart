import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

/// Sign Up Screen - Create new account
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _emailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final email = _emailController.text;
    setState(() {
      _emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    });
  }

  void _onSignup() {
    // Handle signup
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Creating account...',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Redirect to home/main-nav
    context.go('/main-nav');
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 190),

                  // Title
                  Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF181725),
                      height: 29 / 26,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    'Enter your credentials to continue',
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF7C7C7C),
                      height: 15 / 16,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Username Label
                  Text(
                    'Username',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7C7C7C),
                      height: 29 / 16,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Username Input
                  CustomTextField(
                    controller: _usernameController,
                    keyboardType: TextInputType.text,
                    hintText: '',
                  ),

                  const SizedBox(height: 24),

                  // Email Label
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7C7C7C),
                      height: 29 / 16,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Email Input with Checkmark
                  CustomTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: '',
                    suffixIcon: _emailValid
                        ? Icon(Icons.check, color: AppColors.primary, size: 20)
                        : null,
                  ),

                  const SizedBox(height: 24),

                  // Password Label
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF7C7C7C),
                      height: 29 / 16,
                      letterSpacing: 0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Password Input
                  CustomTextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    hintText: '',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF7C7C7C),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Terms and Privacy
                  RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7C7C7C),
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Sign Up Button
                  PrimaryButton(text: 'Sign Up', onPressed: _onSignup),

                  const SizedBox(height: 20),

                  // Login Link
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to login
                        context.pop();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF181725),
                          ),
                          children: [
                            TextSpan(
                              text: 'Signup',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
