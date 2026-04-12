import 'package:flutter/material.dart';

import 'app_shimmer.dart';

/// Uses [Image.network] for http(s) URLs and [Image.asset] otherwise.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  });

  final String path;
  final BoxFit fit;
  final double? width;
  final double? height;

  bool get _isNetwork =>
      path.startsWith('http://') || path.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return Image.network(
        path,
        fit: fit,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return ImageLoadingShimmer(width: width, height: height);
        },
        errorBuilder: (_, __, ___) => _brokenPlaceholder(),
      );
    }
    return Image.asset(
      path,
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (_, __, ___) => _brokenPlaceholder(),
    );
  }

  Widget _brokenPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFF2F3F2),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: (width != null && height != null)
            ? (width! < height! ? width! : height!) * 0.35
            : 32,
        color: Colors.grey,
      ),
    );
  }
}
