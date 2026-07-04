import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Bottom-nav icon: prefers SVG design assets, falls back to legacy PNGs.
class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key,
    required this.svgPath,
    required this.pngFallback,
    this.selected = false,
    this.size = 28,
    this.selectedColor,
  });

  final String svgPath;
  final String pngFallback;
  final bool selected;
  final double size;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _assetExists(svgPath),
      builder: (context, snapshot) {
        final useSvg = snapshot.data == true;
        if (useSvg) {
          return SvgPicture.asset(
            svgPath,
            width: size,
            height: size,
            colorFilter: selected && selectedColor != null
                ? ColorFilter.mode(selectedColor!, BlendMode.srcIn)
                : null,
          );
        }
        return Image.asset(
          pngFallback,
          width: size + 8,
          height: size + 8,
          color: selected ? selectedColor : null,
          errorBuilder: (_, __, ___) => Icon(
            Icons.circle_outlined,
            size: size,
            color: selected ? selectedColor : const Color(0xFF181725),
          ),
        );
      },
    );
  }

  static Future<bool> _assetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }
}
