import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';

class InfiniteScrollScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: InfiniteListView.separated(
        itemBuilder: _buildItem,
        separatorBuilder: (context, index) => const Divider(height: 0.5),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Material(
      child: ListTile(
        title: Text('Item $index'),
      ),
    );
  }
}
