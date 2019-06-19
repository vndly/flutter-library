import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/navigation/navigation_screen_params.dart';
import 'package:flutter_library/screens/misc/navigation/navigation_screen_replaced.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () async {
                String value = await Navigator.of(context)
                    .push(NavigationScreenParams.instance('Hello!'));
                print(value);
              },
              child: Text('Open with params'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                    NavigationScreenReplaced.instance(),
                  ),
              child: Text('Open replacing'),
            ),
          ],
        ),
      ),
    );
  }
}
