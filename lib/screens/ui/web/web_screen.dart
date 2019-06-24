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

  void showInAppBrowser(BuildContext context) async {
    var inAppBrowser = CustomInAppBrowser();
    await inAppBrowser.open(url: 'https://flutter.io', options: {
      'useShouldOverrideUrlLoading': true,
      'useOnLoadResource': true
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () => showWebview(context),
              child: Text('Open webview'),
            ),
            RaisedButton(
              onPressed: () => showInAppBrowser(context),
              child: Text('Open InApp Browser'),
            ),
          ],
        ),
      ),
    );
  }
}
