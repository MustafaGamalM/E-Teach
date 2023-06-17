import 'dart:async';
import 'dart:io';

import 'package:e_teach/constatns.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

//w
class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: WebView(
              initialUrl: AppConstants.walletUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print('WebView is loading (progress : $progress%)');
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.google.com/')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
            ),
          ),
        ],
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

//   // to exit from app
//   void paymentExitApp(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: const Text(
//             'Are you sure completed the pay',
//             style: TextStyle(
//               fontSize: 14.0,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 navigateAndFinish(
//                   context,
//                   RegisterScreen(),
//                 );
//               },
//               child: const Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('No'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
}
