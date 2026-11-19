import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/models/user/user_address_models.dart';
import '../../../core/providers/auth_providers.dart';
import '../../../core/providers/location_user_providers.dart';
import '../../../core/routes/app_router.dart';

/// Our Services design tokens (Figma).
abstract final class ServiceColors {
  static const Color gradientTop = Color(0xFFCDEAFF);
  static const Color gradientBottom = Color(0xFFEEEEEE);
  static const Color primary = Color(0xFF2E67AE);
  static const Color tagYellow = Color(0xFFEBC93F);
  static const Color textPrimary = Color(0xFF181725);
  static const Color textSecondary = Color(0xFF7C7C7C);
  static const Color divider = Color(0xFFCFCFCF);
  static const Color border = Color(0xFF8A8A8A);
  static const Color addressChip = Color(0xFFD3E2F2);

  static const LinearGradient scaffold = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientTop, gradientBottom],
  );
}

TextStyle servicePoppins({
  double size = 14,
  FontWeight weight = FontWeight.w400,
  Color color = ServiceColors.textPrimary,
  double? height,
}) =>
    GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );

/// Scaffold with the CDEAFF → EEEEEE linear gradient background.
class ServiceScaffold extends StatelessWidget {
  const ServiceScaffold({super.key, required this.body, this.bottom});

  final Widget body;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: ServiceColors.gradientBottom,
        bottomNavigationBar: bottom,
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: ServiceColors.scaffold),
          child: SizedBox.expand(child: body),
        ),
      ),
    );
  }
}

/// White circular button used for back / header actions.
class ServiceCircleButton extends StatelessWidget {
  const ServiceCircleButton({
    super.key,
    required this.child,
    this.onTap,
    this.size = 46,
  });

  final Widget child;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}

/// Sub-page header: white back circle + centred title.
class ServicePageHeader extends StatelessWidget {
  const ServicePageHeader({super.key, required this.title, this.onBack});

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: SizedBox(
        height: 46,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: servicePoppins(size: 18, weight: FontWeight.w500),
              ),
            ),
            Positioned(
              left: 0,
              child: ServiceCircleButton(
                onTap: onBack ?? () => Navigator.of(context).maybePop(),
                child: const Icon(Icons.arrow_back, size: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// White rounded card container.
class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = 16,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}

/// Section label ("What type of issue is this ?", "Service Address"…).
class ServiceSectionTitle extends StatelessWidget {
  const ServiceSectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 12),
      child: Text(text, style: servicePoppins(size: 16, weight: FontWeight.w500)),
    );
  }
}

/// Small asset image with an icon fallback.
class ServiceIcon extends StatelessWidget {
  const ServiceIcon(
    this.asset, {
    super.key,
    this.size = 20,
    this.fallback = Icons.circle_outlined,
    this.color,
  });

  final String asset;
  final double size;
  final IconData fallback;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
      color: color,
      errorBuilder: (_, __, ___) => Icon(fallback, size: size, color: color),
    );
  }
}

/// Default saved address line for "Location" headers.
String serviceLocationLabel(WidgetRef ref) {
  final token = ref.read(authStorageProvider).token;
  if (token == null || token.isEmpty) return 'Select location';
  final list =
      ref.watch(userAddressesProvider).value ?? const <UserAddressDto>[];
  if (list.isEmpty) return 'Select location';
  final current = list.firstWhere((a) => a.isDefault, orElse: () => list.first);
  final line = current.addressLine.trim();
  return line.isEmpty ? current.label : line;
}

/// Back circle · centred "Location" picker · avatar (Real Estate, Spare Parts).
class ServiceLocationHeader extends ConsumerWidget {
  const ServiceLocationHeader({
    super.key,
    required this.avatar,
    required this.pinIcon,
    this.padding = const EdgeInsets.fromLTRB(20, 18, 20, 26),
  });

  final String avatar;
  final String pinIcon;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          ServiceCircleButton(
            size: 52,
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back, size: 24),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => context.push(AppRouter.selectLocation),
              child: Column(
                children: [
                  Text('Location', style: servicePoppins(size: 13)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceIcon(
                        pinIcon,
                        size: 16,
                        fallback: Icons.location_on_outlined,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          serviceLocationLabel(ref),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: servicePoppins(size: 14),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down_rounded, size: 22),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.push(AppRouter.v2Profile),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  avatar,
                  width: 54,
                  height: 54,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const CircleAvatar(
                    radius: 27,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
