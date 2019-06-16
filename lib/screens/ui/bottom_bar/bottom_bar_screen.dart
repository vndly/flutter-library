import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  final _pages = [
    PageItem('Home', Colors.red),
    PageItem('Messages', Colors.green),
    PageItem('Profile', Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar'),
      ),
      body: _page(_pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(_pages[0].title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text(_pages[1].title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(_pages[1].title),
          )
        ],
      ),
    );
  }

  Widget _page(PageItem page) {
    return Container(
      color: page.color,
      child: Center(
        child: Text(
          page.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}

@immutable
class PageItem {
  final String title;
  final Color color;

  PageItem(this.title, this.color);
}
