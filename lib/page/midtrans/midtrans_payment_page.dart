import 'package:flutter/material.dart';
import 'package:flutter_foodstore/core/constants/app_config.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MidtransPaymentPage extends StatefulWidget {
  final String snapToken;
  const MidtransPaymentPage({super.key, required this.snapToken});

  @override
  State<MidtransPaymentPage> createState() => _MidtransPaymentPageState();
}

class _MidtransPaymentPageState extends State<MidtransPaymentPage> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          if (url.contains('/success')) {
            context.pop('success');
          } else if (url.contains('/failure')) {
            context.pop('failure');
          } else if (url.contains('transaction_status=settlement')) {
            context.pop('Payment Success');
          } else if (url.contains('transaction_status=expire')) {
            context.pop('Payment Expired');
          } else if (url.contains('transaction_status=cancel')) {
            context.pop('Payment Canceled');
          } else if (url.contains('transaction_status=deny')) {
            context.pop('Payment Denied');
          }
        },
      ))
      ..loadRequest(Uri.parse(AppConfig.URL_PAYMENT + widget.snapToken));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          'Midtrans Payment',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
