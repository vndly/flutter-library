import 'package:flutter/material.dart';

class NavigationScreenParams extends StatelessWidget {
  final String value;

  NavigationScreenParams(this.value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop('Canceled');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.value),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).pop('Bye!'),
            child: Text('Go back'),
          ),
        ),
      ),
    );
  }
}