import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/routes/app_router.dart';
import 'v2_assets.dart';

/// Figma Notifications — Today (mint) + Yesterday (grey) cards.
class V2NotificationsScreen extends StatelessWidget {
  const V2NotificationsScreen({super.key});

  static const _todayBg = Color(0xFFD1E0CF);
  static const _iconBg = Color(0xFFCCE0C1);
  static const _green = Color(0xFF0E5A03);
  static const _yesterdayBg = Color(0xFFF5F5F5);

  static const _today = [
    _Notif(
      icon: V2Assets.notifTruck,
      fallback: Icons.local_shipping_outlined,
      title: 'Your order is on the way!',
      time: '2 min ago',
      body:
          'Your groceries are out for delivery. Get ready to receive your fresh picks.',
    ),
    _Notif(
      icon: V2Assets.notifCheck,
      fallback: Icons.check_circle_outline,
      title: 'Order Confirmed',
      time: '35 min ago',
      body:
          'Your order #ETH2048 has been confirmed. We’re getting everything ready for you.',
    ),
  ];

  static const _yesterday = [
    _Notif(
      icon: V2Assets.notifChat,
      fallback: Icons.chat_bubble_outline,
      title: 'New Message',
      time: '02.01.2026',
      body:
          'Your driver sent you a message regarding your recent delivery #ETH3456.',
    ),
    _Notif(
      icon: V2Assets.notifLate,
      fallback: Icons.schedule_outlined,
      title: 'Running a bit late',
      time: '02.01.2026',
      body:
          'There’s a slight delay due to traffic. Thank you for your patience.',
    ),
    _Notif(
      icon: V2Assets.notifDelivered,
      fallback: Icons.inventory_2_outlined,
      title: 'Order Delivered Successfully',
      time: '02.01.2026',
      body:
          'Your groceries have arrived! We hope you enjoy your fresh picks.',
    ),
    _Notif(
      icon: V2Assets.notifDeal,
      fallback: Icons.local_offer_outlined,
      title: 'Fresh deals just for you!',
      time: '02.01.2026',
      body:
          'Save 20% on selected fresh fruits and vegetables. Your favorites are waiting!',
    ),
    _Notif(
      icon: V2Assets.notifHeart,
      fallback: Icons.favorite_border,
      title: 'Your favorites are waiting',
      time: '02.01.2026',
      body:
          'The groceries you saved are ready to shop. Add your favorites to your cart before you forget!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _header(context),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _sectionLabel('Today'),
                    const SizedBox(height: 10),
                    ..._today.map(
                      (n) => _NotifCard(
                        notif: n,
                        bg: _todayBg,
                        iconBg: _green,
                        iconColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _sectionLabel('Yesterday'),
                    const SizedBox(height: 10),
                    ..._yesterday.map(
                      (n) => _NotifCard(
                        notif: n,
                        bg: _yesterdayBg,
                        iconBg: _iconBg,
                        iconColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
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
              'Notifications',
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

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}

class _Notif {
  const _Notif({
    required this.icon,
    required this.fallback,
    required this.title,
    required this.time,
    required this.body,
  });

  final String icon;
  final IconData fallback;
  final String title;
  final String time;
  final String body;
}

class _NotifCard extends StatelessWidget {
  const _NotifCard({
    required this.notif,
    required this.bg,
    required this.iconBg,
    required this.iconColor,
  });

  final _Notif notif;
  final Color bg;
  final Color iconBg;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              notif.icon,
              width: 20,
              height: 20,
              color: iconColor,
              colorBlendMode: BlendMode.srcIn,
              errorBuilder: (_, __, ___) => Icon(
                notif.fallback,
                size: 20,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        notif.title,
                        style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1.25,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      notif.time,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notif.body,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    height: 1.35,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
