import 'package:flutter/material.dart';
import 'package:flutter_library/screens/ui/web/community_web_view.dart';
import 'package:flutter_library/screens/ui/web/custom_inappbrowser.dart';
import 'package:flutter_library/screens/ui/web/official_web_view.dart';

class WebScreen extends StatelessWidget {
  void showOfficialWebview(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OfficialWebView(),
      ),
    );
  }

  void showCommunityWebview(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CommunityWebView(),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () => showOfficialWebview(context),
              child: const Text('Open official webview'),
            ),
            RaisedButton(
              onPressed: () => showCommunityWebview(context),
              child: const Text('Open community webview'),
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
