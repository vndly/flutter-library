import 'package:flutter/material.dart';
import 'package:flutter_library/utils/nav.dart';

class NavigationScreenParams extends StatelessWidget {
  final String value;

  NavigationScreenParams(this.value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Nav.pop(context, 'Canceled');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.value),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () => Nav.pop(context, 'Bye!'),
            child: Text('Go back'),
          ),
        ),
      ),
    );
  }
}
