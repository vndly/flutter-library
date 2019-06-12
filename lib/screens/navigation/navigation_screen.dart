import 'package:flutter/material.dart';
import 'package:flutter_library/utils/nav.dart';

import 'navigation_screen_params.dart';
import 'navigation_screen_replaced.dart';

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
                String value =
                    await NavigationScreenParams.instance(context, 'Hello!');
                print(value);
              },
              child: Text('Open with params'),
            ),
            RaisedButton(
              onPressed: () =>
                  Nav.pushReplace(context, NavigationScreenReplaced()),
              child: Text('Open replacing'),
            ),
          ],
        ),
      ),
    );
  }
}
