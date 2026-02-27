import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_router.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/primary_button.dart';

/// Location Screen - Select zone and area
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? _selectedZone = 'Banasree';
  String? _selectedArea;

  final List<String> _zones = [
    'Banasree',
    'Gulshan',
    'Dhanmondi',
    'Uttara',
    'Mirpur',
  ];

  final List<String> _areas = [
    'Block A',
    'Block B',
    'Block C',
    'Block D',
    'Block E',
  ];

  void _onSubmit() {
    // Navigate to login screen
    context.push(AppRouter.login);
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
              children: [
                const SizedBox(height: 10),
                // Back Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
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
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),

                        // Location Image from Assets
                        Image.asset(
                          'asstes/images/location.png',
                          width: 250,
                          height: 200,
                          fit: BoxFit.contain,
                        ),

                        const SizedBox(height: 40),

                        // Title
                        Text(
                          'Select Your Location',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF181725),
                            height: 29 / 26,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 16),

                        // Subtitle
                        Text(
                          'Swithch on your location to stay in tune with\nwhat\'s happening in your area',
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7C7C7C),
                            height: 15 / 16,
                            letterSpacing: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 60),

                        // Zone Dropdown
                        CustomDropdown(
                          label: 'Your Zone',
                          value: _selectedZone,
                          hint: 'Select your zone',
                          items: _zones,
                          onChanged: (value) {
                            setState(() {
                              _selectedZone = value;
                            });
                          },
                        ),

                        const SizedBox(height: 24),

                        // Area Dropdown
                        CustomDropdown(
                          label: 'Your Area',
                          value: _selectedArea,
                          hint: 'Types of your area',
                          items: _areas,
                          onChanged: (value) {
                            setState(() {
                              _selectedArea = value;
                            });
                          },
                        ),

                        const SizedBox(height: 40),

                        // Submit Button
                        PrimaryButton(text: 'Submit', onPressed: _onSubmit),

                        const SizedBox(height: 40),
                      ],
                    ),
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
