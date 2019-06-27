import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/navigation/navigation_screen_params.dart';
import 'package:flutter_library/screens/misc/navigation/navigation_screen_replaced.dart';

class NavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () async {
                final value = await Navigator.of(context)
                    .push(NavigationScreenParams.instance('Hello!'));
                print(value);
              },
              child: const Text('Open with params'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                    NavigationScreenReplaced.instance(),
                  ),
              child: const Text('Open replacing'),
            ),
          ],
        ),
      ),
    );
  }
}
