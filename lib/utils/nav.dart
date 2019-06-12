import 'package:flutter/material.dart';

class Nav {
  static Future<T> push<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static Future<T> pushReplace<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static bool pop<T>(BuildContext context, [T result]) {
    return Navigator.of(context).pop(result);
  }
}
