import 'package:flutter/material.dart';
import 'package:flutter_library/screens/ui/web/custom_inappbrowser.dart';
import 'package:flutter_library/screens/ui/web/webview_screen.dart';

class WebScreen extends StatelessWidget {
  void showWebview(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebViewScreen(),
      ),
    );
  }

  Future showInAppBrowser(BuildContext context) async {
    final inAppBrowser = CustomInAppBrowser();
    await inAppBrowser.open(url: 'https://flutter.io', options: {
      'useShouldOverrideUrlLoading': true,
      'useOnLoadResource': true
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () => showWebview(context),
              child: const Text('Open webview'),
            ),
            RaisedButton(
              onPressed: () => showInAppBrowser(context),
              child: const Text('Open InApp Browser'),
            ),
          ],
        ),
      ),
    );
  }
}
