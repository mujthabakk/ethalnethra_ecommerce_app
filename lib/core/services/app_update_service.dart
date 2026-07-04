import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Result of comparing the installed app version against the Play Store version.
class AppVersionStatus {
  const AppVersionStatus({
    required this.installedVersion,
    required this.storeVersion,
    required this.updateRequired,
  });

  /// Version currently installed on the device (read via package_info_plus).
  final String installedVersion;

  /// Latest version published on the Play Store.
  final String storeVersion;

  /// True when the store version is higher than the installed version.
  final bool updateRequired;
}

/// Reads the installed version with `package_info_plus`, looks up the latest
/// version published on the Play Store, and decides whether a (forced) update
/// is required.
class AppUpdateService {
  AppUpdateService._();

  /// Compares the installed version against the Play Store version.
  /// Returns `null` when the check could not be performed (non-Android,
  /// network error, or the store version could not be parsed) so the caller
  /// can fail open and let the user into the app.
  static Future<AppVersionStatus?> checkForUpdate() async {
    if (!Platform.isAndroid) return null;
    try {
      final info = await PackageInfo.fromPlatform();
      final installed = info.version;
      final storeVersion = await _fetchPlayStoreVersion(info.packageName);
      if (storeVersion == null) return null;

      return AppVersionStatus(
        installedVersion: installed,
        storeVersion: storeVersion,
        updateRequired: _compareVersions(storeVersion, installed) > 0,
      );
    } catch (_) {
      return null;
    }
  }

  /// Opens the app's Play Store listing so the user can update.
  /// Tries the native Play Store app first, then falls back to the web URL.
  static Future<void> openStore() async {
    final info = await PackageInfo.fromPlatform();
    final packageName = info.packageName;
    final marketUri = Uri.parse('market://details?id=$packageName');
    final webUri = Uri.parse(
      'https://play.google.com/store/apps/details?id=$packageName',
    );

    try {
      if (await canLaunchUrl(marketUri)) {
        await launchUrl(marketUri, mode: LaunchMode.externalApplication);
        return;
      }
    } catch (_) {
      // Fall through to the web URL.
    }
    await launchUrl(webUri, mode: LaunchMode.externalApplication);
  }

  /// Scrapes the Play Store listing page to read the published version.
  static Future<String?> _fetchPlayStoreVersion(String packageName) async {
    final uri = Uri.parse(
      'https://play.google.com/store/apps/details?id=$packageName&hl=en&gl=US',
    );

    final response = await http.get(
      uri,
      headers: const {
        'User-Agent':
            'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 '
            '(KHTML, like Gecko) Chrome/120.0 Mobile Safari/537.36',
      },
    );

    if (response.statusCode != 200) return null;
    final body = response.body;

    // Play Store embeds the version in different shapes over time, so we try a
    // few known patterns and use the first that matches.
    final patterns = <RegExp>[
      RegExp(r'\[\[\["(\d+\.\d+(?:\.\d+)*)"\]\]'),
      RegExp(r'Current Version[\s\S]{0,80}?>(\d+\.\d+(?:\.\d+)*)<'),
      RegExp(r'"version"\s*:\s*"(\d+\.\d+(?:\.\d+)*)"'),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(body);
      final version = match?.group(1);
      if (version != null && version.isNotEmpty) return version;
    }
    return null;
  }

  /// Returns >0 when [a] is newer than [b], 0 when equal, <0 when older.
  static int _compareVersions(String a, String b) {
    final aParts = _parse(a);
    final bParts = _parse(b);
    final length = aParts.length > bParts.length ? aParts.length : bParts.length;

    for (var i = 0; i < length; i++) {
      final av = i < aParts.length ? aParts[i] : 0;
      final bv = i < bParts.length ? bParts[i] : 0;
      if (av != bv) return av > bv ? 1 : -1;
    }
    return 0;
  }

  static List<int> _parse(String version) {
    return version.split('.').map((part) {
      final digits = RegExp(r'\d+').firstMatch(part)?.group(0);
      return int.tryParse(digits ?? '0') ?? 0;
    }).toList();
  }
}
