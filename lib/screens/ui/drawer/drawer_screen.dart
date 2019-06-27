import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Title'),
            ),
            ListTile(
              title: const Text('This is a title'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
