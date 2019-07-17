import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OfficialWebView extends StatelessWidget {
  const OfficialWebView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Official web view'),
      ),
      body: const WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
