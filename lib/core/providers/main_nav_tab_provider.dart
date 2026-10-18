import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bottom bar: 0 = Categories (home), 1 = Shop, 2 = Cart, 3 = Favourite, 4 = Account.
const int kMainNavCategoryTabIndex = 0;
const int kMainNavShopTabIndex = 1;
const int kMainNavCartTabIndex = 2;

/// Selected index for [MainNavScreen] bottom bar.
/// Defaults to Categories so that is the initial / home page.
final mainNavTabIndexProvider =
    StateProvider<int>((ref) => kMainNavCategoryTabIndex);

/// Selects the category tab before opening the dashboard.
void resetMainNavToHome(WidgetRef ref) {
  ref.read(mainNavTabIndexProvider.notifier).state = kMainNavCategoryTabIndex;
}
