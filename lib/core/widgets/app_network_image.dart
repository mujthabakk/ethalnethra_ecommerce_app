import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../api/api_config.dart';
import 'app_shimmer.dart';

/// Renders API, asset, and base64 images with a consistent fallback.
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

  @override
  Widget build(BuildContext context) {
    final normalizedPath = path.trim();
    if (normalizedPath.isEmpty) {
      return _brokenPlaceholder();
    }

    final memoryBytes = _decodeMemoryImage(normalizedPath);
    if (memoryBytes != null) {
      return Image.memory(
        memoryBytes,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (_, __, ___) => _brokenPlaceholder(),
      );
    }
    if (normalizedPath.startsWith('data:image/')) {
      return _brokenPlaceholder();
    }

    final networkUrl = _networkUrl(normalizedPath);
    if (networkUrl != null) {
      return Image.network(
        networkUrl,
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
      normalizedPath,
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

  String? _networkUrl(String value) {
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return value;
    }
    if (value.startsWith('/')) {
      return Uri.parse(kApiBaseUrl).resolve(value).toString();
    }
    return null;
  }

  Uint8List? _decodeMemoryImage(String value) {
    final payload = _base64Payload(value);
    if (payload == null) return null;

    try {
      final bytes = base64Decode(base64.normalize(payload));
      return _hasSupportedImageHeader(bytes) ? bytes : null;
    } on FormatException {
      return null;
    }
  }

  String? _base64Payload(String value) {
    if (value.startsWith('data:image/svg+xml')) return null;
    if (value.startsWith('data:image/')) {
      final commaIndex = value.indexOf(',');
      if (commaIndex == -1) return null;
      return value.substring(commaIndex + 1).trim();
    }

    final looksLikeBase64 =
        value.length > 24 &&
        !value.contains('/') &&
        RegExp(r'^[A-Za-z0-9+_=/-]+$').hasMatch(value);
    return looksLikeBase64 ? value : null;
  }

  bool _hasSupportedImageHeader(Uint8List bytes) {
    if (bytes.length < 4) return false;
    final isPng =
        bytes.length >= 8 &&
        bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47;
    final isJpeg = bytes[0] == 0xFF && bytes[1] == 0xD8;
    final isGif = bytes[0] == 0x47 && bytes[1] == 0x49 && bytes[2] == 0x46;
    final isWebp =
        bytes.length >= 12 &&
        bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50;
    final isBmp = bytes[0] == 0x42 && bytes[1] == 0x4D;
    return isPng || isJpeg || isGif || isWebp || isBmp;
  }
}
