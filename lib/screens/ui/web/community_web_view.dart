import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CommunityWebView extends StatelessWidget {
  const CommunityWebView();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://flutter.io',
      appBar: AppBar(
        title: const Text('Community web view'),
      ),
      withJavascript: true,
      withZoom: false,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
