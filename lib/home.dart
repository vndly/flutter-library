import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> items;
  HomeScreen(this.items);

  void _onItemSelected(BuildContext context, String item) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(item),
    ));
  }

  Widget _buildHomeItem(BuildContext context, int index) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          items[index],
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
