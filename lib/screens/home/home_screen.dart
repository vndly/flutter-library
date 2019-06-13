import 'package:flutter/material.dart';
import 'package:flutter_library/screens/alert/alert_screen.dart';
import 'package:flutter_library/screens/background/background_screen.dart';
import 'package:flutter_library/screens/dialog/dialog_screen.dart';
import 'package:flutter_library/screens/drawer/drawer_screen.dart';
import 'package:flutter_library/screens/font/font_screen.dart';
import 'package:flutter_library/screens/mvp/mvp_screen.dart';
import 'package:flutter_library/screens/navigation/navigation_screen.dart';
import 'package:flutter_library/screens/sheet/sheet_screen.dart';
import 'package:flutter_library/screens/tabs/tabs_screen.dart';
import 'package:flutter_library/screens/toast/toast_screen.dart';
import 'home_item.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeItem> items = [
    HomeItem('MVP', (context) => MvpScreen('MVP')),
    HomeItem('Dialog', (context) => DialogScreen()),
    HomeItem('Toast', (context) => ToastScreen()),
    HomeItem('Navigation', (context) => NavigationScreen()),
    HomeItem('Drawer', (context) => DrawerScreen()),
    HomeItem('Tabs', (context) => TabsScreen()),
    HomeItem('Alert', (context) => AlertScreen()),
    HomeItem('Sheet', (context) => SheetScreen()),
    HomeItem('Font', (context) => FontScreen()),
    HomeItem('Background', (context) => BackgroundScreen()),
  ];

  void _onItemSelected(BuildContext context, HomeItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: item.builder),
    );
  }

  Widget _buildHomeItem(BuildContext context, int index) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          items[index].name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      onTap: () => _onItemSelected(context, items[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: _buildHomeItem,
        itemCount: items.length,
      ),
    );
  }
}
