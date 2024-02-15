import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
//import 'package:flutter_hooks/flutter_hooks.dart';

// WebViewコントローラー設定
//WebViewController _controller;

//late WebViewController _controller;

@RoutePage()
class DetailScreen extends HookConsumerWidget {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(
              'http://127.0.0.1:5500/assets/maplibre/index3.html')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
        Uri.parse('http://127.0.0.1:5500/assets/maplibre/index3.html'));

  DetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WebViewコントローラー設定

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              // child: WebViewWidget(
              //   // JavaScriptを適用
              //   javascriptMode: JavascriptMode.unrestricted,
              //   // WebView生成時の処理
              //   onWebViewCreated: (WebViewController webViewController) async {
              //     _controller = webViewController;
              //     // HTMLファイル読み込み
              //     await _loadHtmlFromAssets();
              //   },
              // ),
              child: WebViewWidget(
                controller: controller,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              child: const Text('Go back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }

  Future _loadHtmlFromAssets() async {
    // ローカルファイルを指定
    String fileText = await rootBundle
        .loadString('http://127.0.0.1:5500/assets/maplibre/index3.html');
    // HTML指定
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf8'))
        .toString());
  }
}
