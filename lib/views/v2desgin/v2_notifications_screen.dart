import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/providers/location_user_providers.dart';
import '../../core/repositories/content_repository.dart';
import '../../core/routes/app_router.dart';

/// Figma Notifications — Today (mint) + Yesterday (grey) cards.
class V2NotificationsScreen extends ConsumerWidget {
  const V2NotificationsScreen({super.key});

  static const _todayBg = Color(0xFFD1E0CF);
  static const _iconBg = Color(0xFFCCE0C1);
  static const _green = Color(0xFF0E5A03);
  static const _yesterdayBg = Color(0xFFF5F5F5);

  List<_Notif> _map(List<InboxNotification> items) {
    return items
        .map(
          (item) => _Notif(
            icon: '',
            fallback: Icons.notifications_none_rounded,
            title: item.title,
            time: item.timestamp,
            body: item.message,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inbox = ref.watch(notificationsProvider);
    final today = _map(inbox.value?.today ?? const []);
    final yesterday = _map(inbox.value?.yesterday ?? const []);
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
                    if (inbox.isLoading)
                      const Padding(
                        padding: EdgeInsets.all(32),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (inbox.hasError)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          inbox.error.toString(),
                          style: GoogleFonts.poppins(),
                        ),
                      )
                    else if (today.isEmpty && yesterday.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'No notifications',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    if (today.isNotEmpty) ...[
                    _sectionLabel('Today'),
                    const SizedBox(height: 10),
                    ...today.map(
                      (n) => _NotifCard(
                        notif: n,
                        bg: _todayBg,
                        iconBg: _green,
                        iconColor: Colors.white,
                      ),
                    ),
                    ],
                    if (yesterday.isNotEmpty) ...[
                    const SizedBox(height: 18),
                    _sectionLabel('Yesterday'),
                    const SizedBox(height: 10),
                    ...yesterday.map(
                      (n) => _NotifCard(
                        notif: n,
                        bg: _yesterdayBg,
                        iconBg: _iconBg,
                        iconColor: Colors.black,
                      ),
                    ),
                    ],
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
