import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../services/app_update_service.dart';

/// Wraps the app and compares the installed version (via package_info_plus)
/// against the latest Play Store version on first frame and whenever the app
/// returns to the foreground.
///
/// When the store version is higher, a non-dismissible modal is shown. The
/// user must update through the Play Store to continue using the app.
class ForceUpdateWrapper extends StatefulWidget {
  const ForceUpdateWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<ForceUpdateWrapper> createState() => _ForceUpdateWrapperState();
}

class _ForceUpdateWrapperState extends State<ForceUpdateWrapper>
    with WidgetsBindingObserver {
  bool _checkingUpdate = false;
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _runUpdateCheck());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Re-check when the app comes back to the foreground (e.g. the user returned
  /// from the Play Store without completing the update).
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _runUpdateCheck();
    }
  }

  Future<void> _runUpdateCheck() async {
    if (!Platform.isAndroid) return;
    if (_checkingUpdate) return;
    _checkingUpdate = true;

    try {
      final status = await AppUpdateService.checkForUpdate();
      if (!mounted) return;
      if (status == null) return;

      if (status.updateRequired) {
        _showUpdateDialog(status);
      } else if (_dialogShown) {
        // App was updated in the background; dismiss the blocking modal.
        Navigator.of(context, rootNavigator: true).pop();
        _dialogShown = false;
      }
    } catch (_) {
      // Fail open: don't block the user on unexpected errors.
    } finally {
      _checkingUpdate = false;
    }
  }

  void _showUpdateDialog(AppVersionStatus status) {
    if (_dialogShown) return;
    _dialogShown = true;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => _UpdateDialog(status: status),
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({required this.status});

  final AppVersionStatus status;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.system_update_rounded,
                  size: 44,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Update Required',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBackground,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'A new version of the app is available on the Play Store. '
                'Please update to continue using the app.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              _VersionRow(
                installed: status.installedVersion,
                store: status.storeVersion,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: AppUpdateService.openStore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Update Now',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VersionRow extends StatelessWidget {
  const _VersionRow({required this.installed, required this.store});

  final String installed;
  final String store;

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    );
    final valueStyle = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.darkBackground,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current', style: labelStyle),
              const SizedBox(height: 2),
              Text(installed, style: valueStyle),
            ],
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 18,
            color: AppColors.textSecondary,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Latest', style: labelStyle),
              const SizedBox(height: 2),
              Text(store, style: valueStyle.copyWith(color: AppColors.primary)),
            ],
          ),
        ],
      ),
    );
  }
}
