import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Selected index for [MainNavScreen] bottom bar (0 = Home, 1 = Explore, …).
final mainNavTabIndexProvider = StateProvider<int>((ref) => 0);

/// Ensures the shop tab (home) is selected before opening the dashboard.
void resetMainNavToHome(WidgetRef ref) {
  ref.read(mainNavTabIndexProvider.notifier).state = 0;
}
