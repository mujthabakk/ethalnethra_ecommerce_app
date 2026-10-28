import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'v2_assets.dart';

/// Figma Ethal Assistant — text + voice + product suggestion grid.
class V2AiChatScreen extends StatefulWidget {
  const V2AiChatScreen({super.key, this.userName = 'Sam'});

  final String userName;

  @override
  State<V2AiChatScreen> createState() => _V2AiChatScreenState();
}

class _V2AiChatScreenState extends State<V2AiChatScreen> {
  static const _green = Color(0xFF0E5A03);
  static const _bg = Color(0xFFF8FFF6);
  static const _userBubble = Color(0xFFD1E0CF);

  final _controller = TextEditingController();
  final _focus = FocusNode();
  final _speech = SpeechToText();
  final _scroll = ScrollController();

  bool _speechReady = false;
  bool _listening = false;
  String _partial = '';

  final List<_ChatMsg> _messages = [];

  static const _suggestions = [
    'Show me some good quality fruits and vegetables',
    'Show me apple prizes',
    'Add one kilo rice to my cart',
  ];

  static const _produce = [
    _ChatProduct(
      image: V2Assets.prodTomato,
      name: 'Indian Tomato',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFE4DE),
    ),
    _ChatProduct(
      image: V2Assets.prodCarrot,
      name: 'Fresh Carrot',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFCEDD5),
    ),
    _ChatProduct(
      image: V2Assets.prodOnion,
      name: 'Fresh Onion big',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFCE6DE),
    ),
    _ChatProduct(
      image: V2Assets.wishStrawberry,
      name: 'Fresh Strawberries',
      weight: '500 g',
      price: 20,
      oldPrice: 25,
      unit: '₹4/100 g',
      bg: Color(0xFFFFE4DE),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    try {
      final ok = await _speech.initialize(
        onStatus: (s) {
          if (s == 'done' || s == 'notListening') {
            if (mounted) setState(() => _listening = false);
          }
        },
        onError: (_) {
          if (mounted) setState(() => _listening = false);
        },
      );
      if (mounted) setState(() => _speechReady = ok);
    } catch (_) {
      if (mounted) setState(() => _speechReady = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    _scroll.dispose();
    _speech.stop();
    super.dispose();
  }

  Future<void> _toggleListen() async {
    if (_listening) {
      await _speech.stop();
      setState(() => _listening = false);
      if (_partial.trim().isNotEmpty) {
        _controller.text = _partial.trim();
        _controller.selection = TextSelection.collapsed(
          offset: _controller.text.length,
        );
      }
      return;
    }

    final mic = await Permission.microphone.request();
    if (!mic.isGranted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Microphone permission is required for voice.',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: _green,
        ),
      );
      return;
    }

    if (!_speechReady) {
      await _initSpeech();
    }
    if (!_speechReady) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Speech recognition unavailable on this device.',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: _green,
        ),
      );
      return;
    }

    setState(() {
      _listening = true;
      _partial = '';
    });

    await _speech.listen(
      onResult: _onSpeechResult,
      listenOptions: SpeechListenOptions(
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        partialResults: true,
        localeId: 'en_IN',
        cancelOnError: true,
        listenMode: ListenMode.confirmation,
      ),
    );
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _partial = result.recognizedWords;
      _controller.text = _partial;
      _controller.selection = TextSelection.collapsed(
        offset: _controller.text.length,
      );
    });
    if (result.finalResult) {
      setState(() => _listening = false);
    }
  }

  void _send([String? preset]) {
    final text = (preset ?? _controller.text).trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMsg(text: text, isUser: true));
      _controller.clear();
      _partial = '';
      _listening = false;
    });
    _speech.stop();
    _focus.unfocus();

    Future.delayed(const Duration(milliseconds: 450), () {
      if (!mounted) return;
      final reply = _replyFor(text);
      setState(() {
        _messages.add(
          _ChatMsg(
            text: reply.text,
            isUser: false,
            products: reply.showProducts ? _produce : null,
          ),
        );
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scroll.hasClients) {
          _scroll.animateTo(
            _scroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  _Reply _replyFor(String q) {
    final lower = q.toLowerCase();
    if (lower.contains('fruit') ||
        lower.contains('vegetable') ||
        lower.contains('veggie') ||
        lower.contains('produce')) {
      return const _Reply(
        text:
            'Sure, Here are the good quality fruits and vegetables available in the store',
        showProducts: true,
      );
    }
    if ((lower.contains('apple') && lower.contains('price')) ||
        lower.contains('prize') ||
        lower.contains('rate')) {
      return const _Reply(
        text: 'Fresh Apple is ₹120 / kg right now. Want me to add 1 kg to your cart?',
      );
    }
    if (lower.contains('rice')) {
      return const _Reply(
        text:
            'Got it — I can add 1 kg rice to your cart. Open Cart to confirm.',
      );
    }
    return _Reply(
      text:
          'I heard: "$q". I can help you find products, check prices, or add items to cart.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;
    final showEmpty = _messages.isEmpty;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: _bg,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: showEmpty ? _buildEmpty() : _buildChat(),
              ),
              if (showEmpty) _buildSuggestions(),
              if (_listening)
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Listening…',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _green,
                    ),
                  ),
                ),
              _buildInputBar(bottomPad),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 8,
                  ),
                ],
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
              'Ethal Assistant',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
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

  Widget _buildEmpty() {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          V2Assets.aiOrb,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [Color(0xFF7CB342), Color(0xFF0E5A03)],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text.rich(
            TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.35,
              ),
              children: [
                TextSpan(
                  text: 'Hey ${widget.userName}, ',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: _green,
                  ),
                ),
                const TextSpan(text: 'what are you looking for today ?'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }

  Widget _buildChat() {
    return ListView.builder(
      controller: _scroll,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      itemCount: _messages.length,
      itemBuilder: (context, i) {
        final m = _messages[i];
        if (m.isUser) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.78,
              ),
              decoration: BoxDecoration(
                color: _userBubble,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                m.text,
                style: GoogleFonts.poppins(
                  fontSize: 13.5,
                  height: 1.35,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.85,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  m.text,
                  style: GoogleFonts.poppins(
                    fontSize: 13.5,
                    height: 1.35,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            if (m.products != null) ...[
              _ProductGrid(products: m.products!),
              const SizedBox(height: 8),
            ],
          ],
        );
      },
    );
  }

  Widget _buildSuggestions() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
        itemCount: _suggestions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => _send(_suggestions[i]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E5E5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Text(
                _suggestions[i],
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputBar(double bottomPad) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14, 0, 14, 10 + bottomPad * 0.35),
      child: Container(
        height: 56,
        padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 22, color: Colors.black87),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focus,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _send(),
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Ask me anything....',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFFB0B0B0),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _toggleListen,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _listening
                      ? _green.withValues(alpha: 0.12)
                      : Colors.transparent,
                ),
                child: Image.asset(
                  V2Assets.aiMic,
                  width: 18,
                  height: 22,
                  color: _listening ? _green : Colors.black87,
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (_, __, ___) => Icon(
                    _listening ? Icons.mic : Icons.mic_none_rounded,
                    size: 22,
                    color: _listening ? _green : Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => _send(),
              child: Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: _green,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  V2Assets.aiSend,
                  width: 18,
                  height: 18,
                  color: Colors.white,
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.send_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Reply {
  const _Reply({required this.text, this.showProducts = false});
  final String text;
  final bool showProducts;
}

class _ChatMsg {
  const _ChatMsg({
    required this.text,
    required this.isUser,
    this.products,
  });
  final String text;
  final bool isUser;
  final List<_ChatProduct>? products;
}

class _ChatProduct {
  const _ChatProduct({
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    required this.oldPrice,
    required this.unit,
    required this.bg,
  });

  final String image;
  final String name;
  final String weight;
  final int price;
  final int oldPrice;
  final String unit;
  final Color bg;
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid({required this.products});

  final List<_ChatProduct> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.58,
        ),
        itemBuilder: (context, i) => _ChatProductCard(product: products[i]),
      ),
    );
  }
}

class _ChatProductCard extends StatefulWidget {
  const _ChatProductCard({required this.product});

  final _ChatProduct product;

  @override
  State<_ChatProductCard> createState() => _ChatProductCardState();
}

class _ChatProductCardState extends State<_ChatProductCard> {
  static const _green = Color(0xFF0E5A03);
  static const _yellow = Color(0xFFFFD600);
  bool _liked = true;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Container(
      decoration: BoxDecoration(
        color: p.bg,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      p.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => ColoredBox(
                        color: p.bg,
                        child: const Icon(Icons.image_outlined),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 14,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '10 % OFF',
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 14,
                  top: 14,
                  child: GestureDetector(
                    onTap: () => setState(() => _liked = !_liked),
                    child: Icon(
                      Icons.favorite,
                      size: 18,
                      color: _liked
                          ? const Color(0xFFE53935)
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          p.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        p.weight,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '₹ ${p.price}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '₹ ${p.oldPrice}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.grey.shade500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              p.unit,
                              style: GoogleFonts.poppins(
                                fontSize: 9.5,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: _green, width: 1.4),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.add, size: 14, color: _green),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 26,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Instant Order',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity,
                    height: 26,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _yellow,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        'Pre - order',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
