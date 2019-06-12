import 'package:flutter/material.dart';

class TabsUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs up'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Tab 1',
                icon: Icon(Icons.create_new_folder),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(Icons.edit),
              ),
              Tab(
                text: 'Tab 3',
                icon: Icon(Icons.remove_circle_outline),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Tab 1 content'),
            ),
            Center(
              child: Text('Tab 2 content'),
            ),
            Center(
              child: Text('Tab 3 content'),
            ),
          ],
        ),
      ),
    );
  }
}
