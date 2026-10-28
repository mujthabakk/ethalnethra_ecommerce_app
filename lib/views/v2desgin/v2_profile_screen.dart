import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';

/// Figma Profile — avatar, refer banner, For you / Support menus.
class V2ProfileScreen extends StatelessWidget {
  const V2ProfileScreen({super.key});

  static const _green = Color(0xFF3C7A32);
  static const _mint = Color(0xFFDCECD9);
  static const _subText = Color(0xFF609259);

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 24 + bottomPad),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildUserRow(context),
                    const SizedBox(height: 16),
                    _buildReferBanner(),
                    const SizedBox(height: 20),
                    Text(
                      'For you',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _menuCard([
                      _MenuItem(
                        icon: V2Assets.profileReward,
                        fallback: Icons.card_giftcard_outlined,
                        title: 'Your rewards',
                        subtitle: 'see your earned rewards',
                      ),
                      _MenuItem(
                        icon: V2Assets.profileWishlist,
                        fallback: Icons.favorite_border,
                        title: 'Your Wishlist',
                        subtitle: 'Quickly access your saved groceries',
                        onTap: () => context.push(AppRouter.v2Wishlist),
                      ),
                      _MenuItem(
                        icon: V2Assets.profileOrders,
                        fallback: Icons.shopping_cart_outlined,
                        title: 'Your Orders',
                        subtitle: 'Quickly access your saved groceries',
                      ),
                      _MenuItem(
                        icon: V2Assets.profileAddress,
                        fallback: Icons.location_on_outlined,
                        title: 'Saved Addresses',
                        subtitle: 'Manage your delivery locations',
                        onTap: () => context.push(AppRouter.selectLocation),
                      ),
                    ]),
                    const SizedBox(height: 20),
                    Text(
                      'Support & Info',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _menuCard([
                      _MenuItem(
                        icon: V2Assets.profileHelp,
                        fallback: Icons.help_outline,
                        title: 'Help & Support',
                        subtitle: 'Get help and find answers',
                      ),
                      _MenuItem(
                        icon: V2Assets.profileAbout,
                        fallback: Icons.info_outline,
                        title: 'About the app',
                        subtitle: 'Quickly access your saved groceries',
                      ),
                      _MenuItem(
                        icon: null,
                        fallback: Icons.verified_user_outlined,
                        title: 'Privacy Policy',
                        subtitle: 'Quickly access your saved groceries',
                      ),
                      _MenuItem(
                        icon: null,
                        fallback: Icons.logout_rounded,
                        title: 'Log Out',
                        subtitle: null,
                        onTap: () => context.go(AppRouter.v2Login),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRouter.v2Home);
              }
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 42),
        ],
      ),
    );
  }

  Widget _buildUserRow(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipOval(
              child: Image.asset(
                V2Assets.profileAvatar,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 72,
                  height: 72,
                  color: _mint,
                  child: const Icon(Icons.person, size: 36, color: _green),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE8E8E8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(Icons.photo_camera_outlined, size: 14),
              ),
            ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saadhiya Patil',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                'saadhiya@gmail.com',
                style: GoogleFonts.poppins(
                  fontSize: 12.5,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: _green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Edit Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.edit, size: 13, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReferBanner() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
      decoration: BoxDecoration(
        color: _mint,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            V2Assets.profileGift,
            width: 52,
            height: 52,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.card_giftcard, size: 40, color: _green),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Refer & Earn',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Invite your friends and earn\nexciting rewards',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    height: 1.3,
                    color: _subText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: _green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Invite Now',
                  style: GoogleFonts.poppins(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(Icons.chevron_right, size: 16, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuCard(List<_MenuItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.vertical(
                  top: i == 0 ? const Radius.circular(16) : Radius.zero,
                  bottom: i == items.length - 1
                      ? const Radius.circular(16)
                      : Radius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: _mint,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: item.icon != null
                            ? Image.asset(
                                item.icon!,
                                width: 20,
                                height: 20,
                                color: _green,
                                colorBlendMode: BlendMode.srcIn,
                                errorBuilder: (_, __, ___) => Icon(
                                  item.fallback,
                                  size: 20,
                                  color: _green,
                                ),
                              )
                            : Icon(item.fallback, size: 20, color: _green),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            if (item.subtitle != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                item.subtitle!,
                                style: GoogleFonts.poppins(
                                  fontSize: 11.5,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Image.asset(
                        V2Assets.profileChevron,
                        width: 10,
                        height: 14,
                        color: Colors.grey.shade500,
                        colorBlendMode: BlendMode.srcIn,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.chevron_right,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (i < items.length - 1)
                const Divider(
                  height: 1,
                  indent: 68,
                  endIndent: 14,
                  color: Color(0xFFEEEEEE),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem({
    required this.icon,
    required this.fallback,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final String? icon;
  final IconData fallback;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
}
