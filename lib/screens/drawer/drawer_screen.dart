import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Title'),
            ),
            ListTile(
              title: Text('This is a title'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [Text('Hello')],
        ),
      ),
    );
  }
}
