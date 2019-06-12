import 'package:flutter/material.dart';
import 'package:flutter_library/screens/navigation/navigation_screen_replaced.dart';

import 'navigation_screen_params.dart';

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
                String value = await Navigator.of(context).push<String>(
                  MaterialPageRoute(
                    builder: (context) => new NavigationScreenParams('Hello!'),
                  ),
                );
                print(value);
              },
              child: Text('Open with params'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          new NavigationScreenReplaced(),
                    ),
                  ),
              child: Text('Open replacing'),
            ),
          ],
        ),
      ),
    );
  }
}
