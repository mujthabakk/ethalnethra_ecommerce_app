import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/app_router.dart';
import 'kistcher_assets.dart';
import 'kistcher_page_header.dart';

/// Figma Kitchen "Profile" — avatar + edit pill, Refer & Earn banner,
/// white grouped menu cards with `#FDF7E2` icon tiles.
class KistcherProfileScreen extends StatelessWidget {
  const KistcherProfileScreen({super.key, this.onBack, this.bottomInset = 0});

  /// Overrides the back button (used when shown as a shell tab).
  final VoidCallback? onBack;

  /// Extra scroll padding for an overlaid nav bar.
  final double bottomInset;

  static const _ink = Color(0xFF181724);
  static const _iconYellow = Color(0xFFF5C842);

  static const _pageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFEFCBF),
      Color(0xFFFEFCCD),
      Color(0xFFFEFCDC),
      Color(0xFFFEFEEB),
      Color(0xFFFEFEFA),
    ],
    stops: [0.0, 0.23, 0.46, 0.7, 0.93],
  );

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    final forYou = [
      _MenuEntry(
        icon: _assetIcon(KistcherAssets.profileRewards, 20, 19),
        title: 'Your rewards',
        subtitle: 'see your earned rewards',
        onTap: () => _blank(context, 'Your rewards'),
      ),
      _MenuEntry(
        icon: _assetIcon(KistcherAssets.profileWishlist, 20, 19),
        title: 'Your Wishlist',
        subtitle: 'Quickly access your saved groceries',
        onTap: () => context.push(AppRouter.kistcherWishlist),
      ),
      _MenuEntry(
        icon: _assetIcon(KistcherAssets.profileOrders, 21, 22),
        title: 'Your Orders',
        subtitle: 'Quickly access your saved groceries',
        onTap: () => context.push(AppRouter.kistcherOrderTracking),
      ),
      _MenuEntry(
        icon: _assetIcon(KistcherAssets.profileAddress, 20, 23),
        title: 'Saved Addresses',
        subtitle: 'Manage your delivery locations',
        onTap: () => context.push(AppRouter.selectLocation),
      ),
    ];

    final support = [
      _MenuEntry(
        icon: _assetIcon(KistcherAssets.profileHelp, 21, 20),
        title: 'Help & Support',
        subtitle: 'Get help and find answers',
        onTap: () => _blank(context, 'Help & Support'),
      ),
      _MenuEntry(
        icon: _assetIcon(KistcherAssets.profileInfo, 20, 19),
        title: 'About the app',
        subtitle: 'Quickly access your saved groceries',
        onTap: () => _blank(context, 'About the app'),
      ),
      _MenuEntry(
        icon: const Icon(
          Icons.verified_user_outlined,
          size: 21,
          color: _iconYellow,
        ),
        title: 'Privacy Policy',
        subtitle: 'Quickly access your saved groceries',
        onTap: () => _blank(context, 'Privacy Policy'),
      ),
      _MenuEntry(
        icon: const Icon(Icons.logout, size: 21, color: _iconYellow),
        title: 'Log Out',
        onTap: () => context.go(AppRouter.v2Login),
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: _pageGradient),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              23,
              media.padding.top + 31,
              19,
              30 + media.padding.bottom + bottomInset,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                KistcherPageHeader(
                  title: 'Profile',
                  onBack: onBack,
                  showMenu: false,
                ),
                const SizedBox(height: 32),
                _buildUser(),
                const SizedBox(height: 37),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 6),
                  child: _buildRefer(),
                ),
                const SizedBox(height: 22),
                _sectionTitle('For you'),
                const SizedBox(height: 18),
                _MenuCard(entries: forYou),
                const SizedBox(height: 25),
                _sectionTitle('Support & Info'),
                const SizedBox(height: 17),
                _MenuCard(entries: support),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _assetIcon(String asset, double w, double h) =>
      Image.asset(asset, width: w, height: h);

  static void _blank(BuildContext context, String title) =>
      context.push(AppRouter.kistcherBlank, extra: title);

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 15.5,
          fontWeight: FontWeight.w500,
          color: _ink,
        ),
      ),
    );
  }

  Widget _buildUser() {
    return Row(
      children: [
        SizedBox(
          width: 107,
          height: 107,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipOval(
                child: Image.asset(
                  KistcherAssets.profileAvatar,
                  width: 107,
                  height: 107,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                bottom: 5,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    KistcherAssets.profileCamera,
                    width: 13,
                    height: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saadhiya Patil',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: _ink,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'saadhiya@gmail.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: _ink,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 23,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6E084),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(width: 9),
                    Image.asset(
                      KistcherAssets.profileEdit,
                      width: 11,
                      height: 11,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRefer() {
    return Container(
      height: 79,
      padding: const EdgeInsets.only(left: 18, right: 17),
      decoration: BoxDecoration(
        color: const Color(0xFFFAEEAB),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Image.asset(
            KistcherAssets.profileGiftBox,
            width: 84,
            height: 59,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Refer & Earn',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _ink,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Invite your friends and\nearn exciting rewards',
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF77715D),
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 34,
            padding: const EdgeInsets.only(left: 11, right: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4D971),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Invite Now',
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuEntry {
  const _MenuEntry({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.entries});
  final List<_MenuEntry> entries;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEDE9C0).withValues(alpha: 0.5),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          for (var i = 0; i < entries.length; i++) ...[
            if (i > 0)
              const Divider(
                height: 1,
                thickness: 1,
                indent: 9,
                endIndent: 9,
                color: Color(0xFFE4E4E4),
              ),
            _MenuRow(entry: entries[i]),
          ],
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({required this.entry});
  final _MenuEntry entry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: entry.onTap,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 23, right: 20),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF7E2),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: entry.icon,
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: KistcherProfileScreen._ink,
                        height: 1.3,
                      ),
                    ),
                    if (entry.subtitle != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        entry.subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF4D4C56),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 26,
                color: Color(0xFF9E9E9E),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
