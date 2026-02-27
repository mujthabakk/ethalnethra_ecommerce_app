import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// App Text Styles
/// Typography system based on design
class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Gilroy';

  // Welcome Screen Styles
  static TextStyle welcomeTitle = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 29 / 48, // line-height: 29px
    letterSpacing: 0,
  );

  static const TextStyle welcomeSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xB3FFFFFF), // White with 0.7 alpha (B3 in hex)
    height: 15 / 16, // line-height: 15px
    letterSpacing: 0,
  );

  // Heading Styles
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBackground,
    height: 1.3,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBackground,
    height: 1.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBackground,
    height: 1.3,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Button Styles
  static TextStyle buttonLarge = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 18 / 18, // line-height: 18px
    letterSpacing: 0,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.0,
  );

  // Input Styles
  static const TextStyle inputLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  static const TextStyle inputText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBackground,
    height: 1.2,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
  );

  // Link Styles
  static const TextStyle link = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    height: 1.2,
  );

  // Product Detail Screen Specific Styles
  static TextStyle productDetailTitle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold, // Gilroy-Bold
    color: AppColors.darkBackground,
    height: 18 / 24,
    letterSpacing: 0.1,
  );

  static TextStyle productDetailSubtitle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    height: 18 / 16,
    letterSpacing: 0,
  );

  static TextStyle productDetailDescription = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400, // Gilroy-Medium
    color: AppColors.textSecondary,
    height: 21 / 13,
    letterSpacing: 0,
  );

  static TextStyle productDetailSectionHeader = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBackground,
    height: 18 / 16,
    letterSpacing: 0,
  );

  static TextStyle productDetailButton = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 18 / 18,
    letterSpacing: 0,
  );

  static TextStyle exploreCategoryTitle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold, // Gilroy-Bold
    color: AppColors.darkBackground,
    height: 22 / 16,
    letterSpacing: 0.1,
  );

  static TextStyle productCardTitle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold, // Gilroy-Bold
    color: Color(0xFF181725),
    height: 18 / 16,
    letterSpacing: 0.1,
  );

  static TextStyle productCardSubtitle = const TextStyle(
    fontFamily: fontFamily, // Gilroy
    fontSize: 14,
    fontWeight: FontWeight.w400, // Gilroy-Medium
    color: Color(0xFF7C7C7C),
    height: 18 / 14,
    letterSpacing: 0,
  );

  static TextStyle productCardPrice = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF181725),
    height: 18 / 18,
    letterSpacing: 0.1,
  );

  // Filter Screen Styles
  static TextStyle filterSectionTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle filterOptionSelected = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Gilroy-Medium
    color: AppColors.primary,
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle filterOptionUnselected = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Gilroy-Medium
    color: Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle filterButton = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFF9FF),
    height: 18 / 18,
    letterSpacing: 0,
  );

  // Cart Screen Styles
  static TextStyle cartItemTitle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold, // Gilroy-Bold
    color: Color(0xFF181725),
    height: 18 / 16,
    letterSpacing: 0.1,
  );

  static TextStyle cartItemSubtitle = const TextStyle(
    fontFamily: fontFamily, // Gilroy
    fontSize: 14,
    fontWeight: FontWeight.w400, // Gilroy-Medium
    color: Color(0xFF7C7C7C),
    height: 18 / 14,
    letterSpacing: 0,
  );

  static TextStyle cartItemPrice = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF181725),
    height: 27 / 18,
    letterSpacing: 0.1,
  );

  static TextStyle cartButton = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.0,
    letterSpacing: 0,
  );

  // Checkout Bottom Sheet Styles
  static TextStyle checkoutTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle checkoutSectionLabel = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF7C7C7C),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle checkoutValueLabel = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle checkoutTerms = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF7C7C7C),
    height: 21 / 14,
    letterSpacing: 0,
  );

  // Order Success Screen Styles
  static TextStyle orderSuccessTitle = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle orderSuccessDescription = const TextStyle(
    fontFamily: fontFamily, // Gilroy
    fontSize: 16,
    fontWeight: FontWeight.w400, // Gilroy-Medium
    color: Color(0xFF7C7C7C),
    height: 21 / 16,
    letterSpacing: 0,
  );

  static TextStyle orderSuccessBackHome = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 18 / 18,
    letterSpacing: 0,
  );

  // Account Screen Styles
  static TextStyle accountName = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold, // Gilroy-Bold
    color: Color(0xFF181725),
    height: 18 / 20,
    letterSpacing: 0,
  );

  static TextStyle accountEmail = const TextStyle(
    fontFamily: fontFamily, // Gilroy-Regular
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF7C7C7C),
    height: 18 / 16,
    letterSpacing: 0,
  );

  static TextStyle accountMenuLabel = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle logoutButton = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 18 / 18,
    letterSpacing: 0,
  );

  // Order Status Screen Styles
  static TextStyle orderStatusSummaryTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle orderStatusSummaryLabel = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF181725),
    height: 1.2,
    letterSpacing: 0,
  );

  static TextStyle orderStatusSummaryValue = const TextStyle(
    fontFamily: fontFamily, // Gilroy
    fontSize: 15,
    fontWeight: FontWeight.w400, // Gilroy-Regular/Medium
    color: Color(0xFF181725),
    height: 1.2,
    letterSpacing: 0,
  );

  static TextStyle orderStatusItemLabel = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  // Order History Styles
  static TextStyle orderHistoryTitle = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle orderItemTitle = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold, // Gilroy-Bold
    color: Color(0xFF181725),
    height: 1.0,
    letterSpacing: 0,
  );

  static TextStyle reorderButtonText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFF3603F), // Orange/Coral color from screenshot
    height: 1.0,
    letterSpacing: 0,
  );

  // Edit Profile Styles
  static TextStyle editProfileInputLabel = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF7C7C7C),
  );

  static TextStyle editProfileValue = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF181725),
  );

  static TextStyle editProfileChangeLink = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFF3603F),
  );

  // Address Screen Styles
  static TextStyle addressSectionHeader = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF181725),
    letterSpacing: 0,
  );

  static TextStyle addNewAddressButtonText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFF3603F),
    letterSpacing: 0,
  );
}
