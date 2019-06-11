import 'package:flutter/material.dart';
import 'package:flutter_library/screens/dialog/dialog_screen.dart';
import 'package:flutter_library/screens/mvp/mvp_screen.dart';
import 'package:flutter_library/screens/toast/toast_screen.dart';
import 'home_item.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeItem> items = [
    HomeItem('MVP', (context) => MvpScreen()),
    HomeItem('Dialog', (context) => DialogScreen()),
    HomeItem('Toast', (context) => ToastScreen())
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
