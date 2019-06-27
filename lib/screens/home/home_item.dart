import 'package:flutter/cupertino.dart';

class HomeItem {
  final String name;
  final WidgetBuilder builder;

  HomeItem([this.name, this.builder]);

  bool get isHeader => builder == null;
}
