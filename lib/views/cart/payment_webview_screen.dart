import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../core/constants/app_colors.dart';
import '../../core/models/orders/orders_models.dart';

/// In-app Razorpay payment link browser.
///
/// Pops with [PlaceOrderResponse] on success, or `null` if the user cancels.
class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({
    super.key,
    required this.paymentLink,
    this.payment,
  });

  final String paymentLink;
  final CreatePaymentResponse? payment;

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  WebViewController? _controller;
  var _loading = true;
  var _completed = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initWebView());
  }

  PlatformWebViewControllerCreationParams _platformParams() {
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      return WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    }
    if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      return AndroidWebViewControllerCreationParams();
    }
    return const PlatformWebViewControllerCreationParams();
  }

  Future<void> _initWebView() async {
    if (!mounted) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
      _controller = null;
    });

    try {
      final controller = WebViewController.fromPlatformCreationParams(
        _platformParams(),
      );

      await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      await controller.setBackgroundColor(Colors.white);
      await controller.setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (mounted) setState(() => _loading = true);
          },
          onPageFinished: (url) {
            if (mounted) setState(() => _loading = false);
            _maybeComplete(url);
          },
          onNavigationRequest: (request) {
            _maybeComplete(request.url);
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {
            final url = change.url;
            if (url != null) _maybeComplete(url);
          },
          onWebResourceError: (error) {
            debugPrint('Payment WebView error: ${error.description}');
          },
        ),
      );

      final platform = controller.platform;
      if (platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(kDebugMode);
        await platform.setMediaPlaybackRequiresUserGesture(false);
      }

      await controller.loadRequest(Uri.parse(widget.paymentLink));

      if (!mounted) return;
      setState(() {
        _controller = controller;
        _loading = false;
      });
    } on PlatformException catch (e) {
      debugPrint('Payment WebView PlatformException: $e');
      if (!mounted) return;
      setState(() {
        _loading = false;
        _errorMessage =
            'Payment page could not start. Fully stop the app and run it again '
            '(hot restart is not enough after installing WebView).';
      });
    } catch (e) {
      debugPrint('Payment WebView error: $e');
      if (!mounted) return;
      setState(() {
        _loading = false;
        _errorMessage = 'Unable to open payment page. Please try again.';
      });
    }
  }

  bool _isSuccessUrl(String url) {
    final lower = url.toLowerCase();
    return lower.contains('payment_id=') ||
        lower.contains('razorpay_payment_id') ||
        lower.contains('status=success') ||
        lower.contains('payment/success') ||
        lower.contains('paymentsuccess') ||
        lower.contains('/success') ||
        (lower.contains('rzp') && lower.contains('success'));
  }

  bool _isFailureUrl(String url) {
    final lower = url.toLowerCase();
    return lower.contains('status=failed') ||
        lower.contains('status=failure') ||
        lower.contains('payment/failed') ||
        lower.contains('paymentfailed') ||
        lower.contains('/failed') ||
        lower.contains('status=cancelled') ||
        lower.contains('status=canceled');
  }

  PlaceOrderResponse _successResult() {
    final payment = widget.payment;
    final summary = payment?.summary;
    final reward = payment?.reward;
    return PlaceOrderResponse(
      orderId: payment?.razorpayOrderId ?? '',
      orderNumber: payment?.razorpayOrderId ?? '',
      status: 'paid',
      total: summary?.total ?? reward?.payableAmount ?? 0,
      discount: summary?.rewardDiscount ?? reward?.rewardDiscount ?? 0,
      deliveryCharge: summary?.deliveryCharge ?? 0,
      paymentMethod: PaymentMethod.online.apiValue,
      loyaltyApplied: reward?.used ?? false,
      eta: '',
    );
  }

  void _maybeComplete(String url) {
    if (_completed || !mounted) return;

    if (_isFailureUrl(url)) {
      _completed = true;
      Navigator.of(context).pop(null);
      return;
    }

    if (!_isSuccessUrl(url)) return;

    _completed = true;
    Navigator.of(context).pop(_successResult());
  }

  Future<void> _onClose() async {
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel payment?'),
        content: const Text(
          'If you leave now, your payment may not be completed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    if (leave == true && mounted) {
      Navigator.of(context).pop(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF181725)),
          onPressed: _onClose,
        ),
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Color(0xFF181725),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: _errorMessage != null
          ? _ErrorBody(
              message: _errorMessage!,
              onRetry: _initWebView,
              onCancel: () => Navigator.of(context).pop(null),
            )
          : Stack(
              children: [
                if (controller != null)
                  WebViewWidget(controller: controller)
                else
                  const SizedBox.expand(),
                if (_loading)
                  const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
              ],
            ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({
    required this.message,
    required this.onRetry,
    required this.onCancel,
  });

  final String message;
  final VoidCallback onRetry;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off_rounded, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF181725),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Retry'),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: onCancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
