import 'package:flutter/material.dart';

class NavigationScreenAlone extends StatelessWidget {
  static MaterialPageRoute<T> instance<T>() {
    return MaterialPageRoute(
      builder: (context) => NavigationScreenAlone(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alone'),
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
