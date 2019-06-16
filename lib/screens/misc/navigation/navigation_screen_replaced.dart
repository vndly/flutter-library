import 'package:flutter/material.dart';
import 'package:flutter_library/utils/nav.dart';

class NavigationScreenReplaced extends StatelessWidget {
  static MaterialPageRoute instance(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) => NavigationScreenReplaced(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replaced'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Nav.pop(context),
          child: Text('Go back'),
        ),
      ),
    );
  }
}