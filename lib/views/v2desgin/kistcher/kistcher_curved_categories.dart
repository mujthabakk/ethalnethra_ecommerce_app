import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KistcherCategory {
  const KistcherCategory({required this.image, required this.label});
  final String image;
  final String label;
}

/// Rotating "wheel" of categories, matching the Figma design:
/// - a thick grey ring (band) whose top arc sits behind the items
/// - all items the same size, placed on one big circle (so sides drop lower)
/// - a curved black underline on the inner edge of the band under the selected item
/// Drag left/right to rotate; it snaps to the nearest item. Tap to select.
class KistcherCurvedCategories extends StatefulWidget {
  const KistcherCurvedCategories({
    super.key,
    required this.categories,
    this.onSelected,
    this.initialIndex = 2,
    this.bandOverflow = 130,
  });

  final List<KistcherCategory> categories;
  final ValueChanged<int>? onSelected;
  final int initialIndex;

  /// How far (design px) the grey band keeps painting below this widget,
  /// so it continues down the screen edges behind "Hot deals".
  final double bandOverflow;

  @override
  State<KistcherCurvedCategories> createState() =>
      _KistcherCurvedCategoriesState();
}

class _KistcherCurvedCategoriesState extends State<KistcherCurvedCategories>
    with SingleTickerProviderStateMixin {
  // All values measured from the Figma frame (390 wide) and scaled to the screen.
  static const double _designW = 390;
  static const double _itemR = 282; // radius of the circle item centres sit on
  static const double _outerR = 313; // grey band outer radius
  static const double _innerR = 233; // grey band inner radius
  static const double _centerY = 321; // wheel centre, measured from widget top
  static const double _dia = 48; // image circle diameter (same for all)
  static const double _height = 122;
  static const double _itemW = 96;
  static const double _underlineHalf = 32;
  static const double _step = 21.5 * math.pi / 180; // angle between items
  static const double _maxVisible = 80 * math.pi / 180;

  /// Fractional index of the item currently at the top of the wheel.
  late final AnimationController _pos;
  late int _selected;

  int get _n => widget.categories.length;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex.clamp(0, math.max(0, _n - 1));
    _pos = AnimationController.unbounded(
      vsync: this,
      value: _selected.toDouble(),
    );
  }

  @override
  void dispose() {
    _pos.dispose();
    super.dispose();
  }

  double _pxPerItem(double s) => _itemR * s * _step;

  void _onDragUpdate(DragUpdateDetails d, double s) {
    var delta = -d.delta.dx / _pxPerItem(s);
    final p = _pos.value;
    if (p < 0 || p > _n - 1) delta *= 0.35; // rubber-band at the ends
    _pos.value = (p + delta).clamp(-0.6, _n - 1 + 0.6);
  }

  void _onDragEnd(DragEndDetails d, double s) {
    final itemsPerSec = -d.velocity.pixelsPerSecond.dx / _pxPerItem(s);
    _animateTo((_pos.value + itemsPerSec * 0.18).round());
  }

  void _animateTo(int index) {
    if (_n == 0) return;
    final i = index.clamp(0, _n - 1);
    final dist = (_pos.value - i).abs();
    _pos.animateTo(
      i.toDouble(),
      duration: Duration(
        milliseconds: (220 + 120 * dist).clamp(220, 600).round(),
      ),
      curve: Curves.easeOutCubic,
    );
    if (i != _selected) {
      _selected = i;
      widget.onSelected?.call(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final w = box.maxWidth;
        final s = w / _designW;
        final center = Offset(w / 2, _centerY * s);

        return SizedBox(
          height: _height * s,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: (_) => _pos.stop(),
            onHorizontalDragUpdate: (d) => _onDragUpdate(d, s),
            onHorizontalDragEnd: (d) => _onDragEnd(d, s),
            child: AnimatedBuilder(
              animation: _pos,
              builder: (context, _) {
                final p = _pos.value;
                final children = <Widget>[
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _BandPainter(
                        center: center,
                        outerR: _outerR * s,
                        innerR: _innerR * s,
                        clipBottom: (_height + widget.bandOverflow) * s,
                        underlineHalfAngle: _underlineHalf / _innerR,
                        underlineWidth: 4.5 * s,
                      ),
                    ),
                  ),
                ];

                for (var i = 0; i < _n; i++) {
                  final a = (i - p) * _step;
                  if (a.abs() > _maxVisible) continue;
                  final x = center.dx + _itemR * s * math.sin(a);
                  final y = center.dy - _itemR * s * math.cos(a);
                  final t = (i - p).abs().clamp(0.0, 1.0);

                  children.add(
                    Positioned(
                      left: x - _itemW * s / 2,
                      top: y - _dia * s / 2,
                      width: _itemW * s,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => _animateTo(i),
                        child: _CategoryItem(
                          category: widget.categories[i],
                          diameter: _dia * s,
                          scale: s,
                          labelColor: Color.lerp(
                            Colors.black,
                            const Color(0xFF5E5E5E),
                            t,
                          )!,
                        ),
                      ),
                    ),
                  );
                }

                return Stack(clipBehavior: Clip.none, children: children);
              },
            ),
          ),
        );
      },
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.category,
    required this.diameter,
    required this.scale,
    required this.labelColor,
  });

  final KistcherCategory category;
  final double diameter;
  final double scale;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: diameter,
          height: diameter,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            category.image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.fastfood, color: Colors.white),
          ),
        ),
        SizedBox(height: 4 * scale),
        Text(
          category.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 13 * scale,
            fontWeight: FontWeight.w500,
            color: labelColor,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

/// Grey ring + curved underline on its inner edge.
class _BandPainter extends CustomPainter {
  const _BandPainter({
    required this.center,
    required this.outerR,
    required this.innerR,
    required this.clipBottom,
    required this.underlineHalfAngle,
    required this.underlineWidth,
  });

  final Offset center;
  final double outerR;
  final double innerR;
  final double clipBottom;
  final double underlineHalfAngle;
  final double underlineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, clipBottom));

    final ring = Path()
      ..fillType = PathFillType.evenOdd
      ..addOval(Rect.fromCircle(center: center, radius: outerR))
      ..addOval(Rect.fromCircle(center: center, radius: innerR));
    canvas.drawPath(ring, Paint()..color = const Color(0xFFE8E8E8));
    canvas.restore();

    final underline = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = underlineWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerR + underlineWidth * 0.2),
      -math.pi / 2 - underlineHalfAngle,
      underlineHalfAngle * 2,
      false,
      underline,
    );
  }

  @override
  bool shouldRepaint(covariant _BandPainter old) =>
      old.center != center ||
      old.outerR != outerR ||
      old.innerR != innerR ||
      old.clipBottom != clipBottom;
}
