// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/routes/app_router.dart';
// import '../../core/storage/auth_storage.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkAuth();
//   }

//   Future<void> _checkAuth() async {
//     // Show splash for 2 seconds
//     await Future.delayed(const Duration(seconds: 2));
//     if (!mounted) return;

//     final token = AuthStorage().token;
//     if (token != null && token.isNotEmpty) {
//       context.go(AppRouter.mainNav);
//     } else {
//       context.go(AppRouter.mobileNumber);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.shopping_basket,
//               size: 80,
//               color: Colors.white,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Nectar',
//               style: GoogleFonts.poppins(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 letterSpacing: 1.2,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'online groceries',
//               style: GoogleFonts.poppins(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//                 letterSpacing: 2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_router.dart';
import '../../core/storage/auth_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuth();
    });
  }

  Future<void> _checkAuth() async {
    try {

      // Splash delay
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      final token = AuthStorage().token;

      if (token != null && token.isNotEmpty) {

        // Navigate to home
        context.go(AppRouter.mainNav);

      } else {

        // Navigate to login/mobile page
        context.go(AppRouter.mobileNumber);
      }

    } catch (e) {

      debugPrint("Splash Error: $e");

      // Fallback navigation
      if (mounted) {
        context.go(AppRouter.mobileNumber);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.shopping_basket,
              size: 80,
              color: Colors.white,
            ),

            const SizedBox(height: 16),

            Text(
              'Nectar',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Online Groceries',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}