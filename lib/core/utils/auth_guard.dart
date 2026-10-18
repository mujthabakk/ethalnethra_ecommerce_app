import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../api/api_exception.dart';
import '../constants/app_colors.dart';
import '../providers/auth_providers.dart';
import '../routes/app_router.dart';
import '../widgets/added_to_cart_dialog.dart';

/// Returns `true` when a non-empty auth token is stored.
bool isLoggedIn(WidgetRef ref) {
  final token = ref.read(authStorageProvider).token;
  return token != null && token.isNotEmpty;
}

bool _isUnauthenticatedError(Object error) {
  if (error is ApiException) {
    if (error.statusCode == 401) return true;
    final m = error.message.toLowerCase();
    return m.contains('unauthenticated') || m.contains('unauthorize');
  }
  final s = error.toString().toLowerCase();
  return s.contains('unauthenticated') || s.contains('unauthorize');
}

/// If not logged in, shows a login dialog and returns `false`.
Future<bool> ensureLoggedIn(BuildContext context, WidgetRef ref) async {
  if (isLoggedIn(ref)) return true;
  await showLoginRequiredDialog(context);
  return false;
}

Future<void> showLoginRequiredDialog(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Login required'),
      content: const Text(
        'Please log in to add items to your cart or favorites.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(ctx).pop();
            context.push(AppRouter.mobileNumber);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          child: const Text('Log in'),
        ),
      ],
    ),
  );
}

/// Shows a success popup after a product is added to the cart.
Future<void> showAddedToCartPopup(
  BuildContext context, {
  required String productName,
  bool preorder = false,
}) {
  return AddedToCartDialog.show(
    context,
    productName: productName,
    preorder: preorder,
  );
}

/// Maps API/auth errors to a friendly snackbar or login dialog.
Future<void> showCartOrAuthError(
  BuildContext context,
  Object error,
) async {
  if (_isUnauthenticatedError(error)) {
    await showLoginRequiredDialog(context);
    return;
  }
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$error'),
      backgroundColor: Colors.red.shade600,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
