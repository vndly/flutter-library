import 'package:flutter/material.dart';

class NavigationScreenReplaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replaced'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Go back'),
        ),
      ),
    );
  }
}
