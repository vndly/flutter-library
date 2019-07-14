import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RowOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row option'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => RowItem(index + 1),
        itemCount: 10,
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final int index;

  const RowItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigoAccent,
          child: Text('$index'),
          foregroundColor: Colors.white,
        ),
        title: Text('Item nº $index'),
        subtitle: Text('Subtitle of item nº $index'),
      ),
      actions: [
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _optionSelected('Archive'),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _optionSelected('Share'),
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _optionSelected('More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _optionSelected('Delete'),
        ),
      ],
    );
  }

  void _optionSelected(String option) {
    print(option);
  }
}
