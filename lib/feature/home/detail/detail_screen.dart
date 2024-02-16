import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

late WebViewController _controller;

@RoutePage()
class DetailScreen extends HookConsumerWidget {
  final controller = WebViewController()
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

  // Future _loadHtmlFromAssets() async {
  //   // ローカルファイルを指定
  //   String fileText =
  //       await rootBundle.loadString('assets/maplibre/index3.html');
  //   // HTML指定
  //   _controller.loadUrl(Uri.dataFromString(fileText,
  //           mimeType: 'text/html', encoding: Encoding.getByName('utf8'))
  //       .toString());
  // }
}


// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late WebViewController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map App'),
//       ),
//       body: WebView(
//         onWebViewCreated: (controller) {
//           _controller = controller;
//           _loadHtmlFromAssets();
//         },
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }

//   Future<void> _loadHtmlFromAssets() async {
//     String fileText = await rootBundle.loadString('assets/maplibre/index3.html');
//     // final String contentBase64 =
//     //     base64Encode(const Utf8Encoder().convert(fileText));
//     // _controller.loadUrl('data:text/html;base64,$contentBase64');
//     final uri = Uri.dataFromString(
//       fileText,
//       mimeType: 'text/html',
//       encoding: Encoding.getByName('utf-8'),
//     );
//     _controller.loadRequest(uri);
//   }
// }
