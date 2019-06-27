import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/shared_preferences/shared_preferences_normal_screen.dart';
import 'package:flutter_library/screens/misc/shared_preferences/shared_preferences_secure_screen.dart';

class SharedPreferencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text('Normal'),
              onPressed: () => Navigator.of(context)
                  .push(SharedPreferencesNormalScreen.instance()),
            ),
            RaisedButton(
              child: const Text('Encrypted'),
              onPressed: () => Navigator.of(context)
                  .push(SharedPreferencesSecureScreen.instance()),
            ),
          ],
        ),
      ),
    );
  }
}
