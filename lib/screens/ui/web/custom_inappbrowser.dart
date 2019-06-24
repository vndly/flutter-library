import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class CustomInAppBrowser extends InAppBrowser {
  @override
  void shouldOverrideUrlLoading(String url) {
    webViewController.loadUrl(url);
  }
}
