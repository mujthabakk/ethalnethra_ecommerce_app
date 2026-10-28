import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared Kitchen sub-page header (Cart / Review / Profile):
/// soft yellow glass back circle, centred title, optional kebab menu.
class KistcherPageHeader extends StatelessWidget {
  const KistcherPageHeader({
    super.key,
    required this.title,
    this.onBack,
    this.showMenu = true,
    this.onMenu,
  });

  final String title;
  final VoidCallback? onBack;
  final bool showMenu;
  final VoidCallback? onMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1.2,
            ),
          ),
          Positioned(
            left: 0,
            child: KistcherBackCircle(
              onTap: onBack ?? () => Navigator.of(context).maybePop(),
            ),
          ),
          if (showMenu)
            Positioned(
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onMenu,
                child: const SizedBox(
                  width: 32,
                  height: 40,
                  child: Icon(Icons.more_vert, size: 26, color: Colors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Figma back button: 34px pale-yellow orb with a light top-left highlight.
class KistcherBackCircle extends StatelessWidget {
  const KistcherBackCircle({super.key, required this.onTap, this.size = 34});

  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFAF9C6), Color(0xFFEDEBB1)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD9D79A).withValues(alpha: 0.6),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.arrow_back, size: 19, color: Colors.black),
      ),
    );
  }
}
