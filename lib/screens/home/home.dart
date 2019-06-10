import 'package:flutter/material.dart';
import 'package:flutter_library/screens/item1/item1.dart';
import 'home_item.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeItem> items = [
    HomeItem('Item 1', (context) => Item1Screen()),
    HomeItem('Item 2', (context) => Item1Screen()),
    HomeItem('Item 3', (context) => Item1Screen())
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
      body: ListView.builder(
        itemBuilder: _buildHomeItem,
        itemCount: items.length,
      ),
    );
  }
}
