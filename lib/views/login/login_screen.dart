import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

/// Login Screen - Email and password login
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    // Handle login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Logging in...',
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
                    'Login',
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
                    'Enter your email and password',
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

                  // Email Input
                  CustomTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: '',
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

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF181725),
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Log In Button
                  PrimaryButton(text: 'Log In', onPressed: _onLogin),

                  const SizedBox(height: 20),

                  // Sign Up Link
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to sign up
                        context.push('/signup');
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account? ',
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
                                decoration: TextDecoration.underline,
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
