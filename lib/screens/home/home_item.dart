import 'package:flutter/cupertino.dart';

typedef Widget Builder(BuildContext context);

class HomeItem {
  String name;
  WidgetBuilder builder;

  HomeItem(this.name, this.builder);
}
