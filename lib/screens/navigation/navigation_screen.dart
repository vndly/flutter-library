import 'package:flutter/material.dart';
import 'package:flutter_library/screens/navigation/navigation_screen_target.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            String value = await Navigator.of(context).push<String>(
              MaterialPageRoute(
                builder: (context) => new NavigationScreenTarget('Hello!'),
              ),
            );
            print(value);
          },
          child: Text('Open new screen'),
        ),
      ),
    );
  }
}
