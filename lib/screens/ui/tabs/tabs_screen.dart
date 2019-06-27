import 'package:flutter/material.dart';
import 'package:flutter_library/screens/ui/tabs/tabs_up_screen.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TabsUpScreen(),
                    ),
                  ),
              child: const Text('Up'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TabsUpScreen(),
                    ),
                  ),
              child: const Text('Down'),
            ),
          ],
        ),
      ),
    );
  }
}
