import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/providers/location_user_providers.dart';
import '../../../core/repositories/content_repository.dart';
import 'kistcher_assets.dart';

/// Figma Kitchen "Notifications" — Today cards in yellow, Yesterday in grey.
class KistcherNotificationsScreen extends ConsumerWidget {
  const KistcherNotificationsScreen({super.key});

  static const _ink = Color(0xFF181724);

  static const _pageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFEE6),
      Color(0xFFFFFEEB),
      Color(0xFFFFFEF1),
      Color(0xFFFEFEF8),
      Color(0xFFFFFFFD),
    ],
    stops: [0.0, 0.2, 0.46, 0.73, 0.93],
  );

  List<_Notice> _map(List<InboxNotification> items) {
    return items
        .map(
          (item) => _Notice(
            KistcherAssets.notifDeals,
            item.title,
            item.timestamp,
            item.message,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = MediaQuery.of(context);
    final grouped = ref.watch(notificationsProvider).valueOrNull ??
        const GroupedNotifications();
    final today = _map(grouped.today);
    final yesterday = _map(grouped.yesterday);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: _pageGradient),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              26,
              media.padding.top + 36,
              19,
              30 + media.padding.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                const SizedBox(height: 40),
                _sectionTitle('Today'),
                const SizedBox(height: 18),
                for (var i = 0; i < today.length; i++) ...[
                  if (i > 0) const SizedBox(height: 22),
                  _NoticeCard(notice: today[i], highlighted: true),
                ],
                const SizedBox(height: 24),
                _sectionTitle('Yesterday'),
                const SizedBox(height: 14),
                for (var i = 0; i < yesterday.length; i++) ...[
                  if (i > 0) const SizedBox(height: 21),
                  _NoticeCard(notice: yesterday[i], highlighted: false),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            'Notifications',
            style: GoogleFonts.poppins(
              fontSize: 16.5,
              fontWeight: FontWeight.w500,
              color: _ink,
            ),
          ),
          Positioned(
            left: 11,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFF2F1E8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 16.5,
        fontWeight: FontWeight.w500,
        color: _ink,
      ),
    );
  }
}

class _Notice {
  const _Notice(this.icon, this.title, this.time, this.body);
  final String icon;
  final String title;
  final String time;
  final String body;
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({required this.notice, required this.highlighted});

  final _Notice notice;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 70),
      padding: const EdgeInsets.fromLTRB(17, 11, 17, 11),
      decoration: BoxDecoration(
        color: highlighted ? const Color(0xFFFCF5CF) : const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 51,
            height: 49,
            decoration: BoxDecoration(
              color: highlighted
                  ? const Color(0xFFF2D262)
                  : const Color(0xFFF3F0E5),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Image.asset(notice.icon, width: 26, height: 26),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notice.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: KistcherNotificationsScreen._ink,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      notice.time,
                      style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF6A6762),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    notice.body,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: KistcherNotificationsScreen._ink,
                      height: 1.55,
                    ),
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
