import 'package:flutter/material.dart';

class InfiniteScrollScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: InfiniteNumberList(),
    );
  }
}

class InfiniteNumberList extends StatefulWidget {
  @override
  _InfiniteNumberListState createState() => _InfiniteNumberListState();
}

class _InfiniteNumberListState extends State<InfiniteNumberList> {
  final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      _addToBottom();
    }
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {
      _addToTop();
    }
  }

  void _addToTop() {
    print('Adding to top');

    Future.delayed(
      Duration(seconds: 2),
      () => setState(
        () {
          final first = list.isNotEmpty ? list[0] : 0;

          for (var i = 1; i <= 10; i++) {
            list.insert(0, first - i);
          }
        },
      ),
    );
  }

  void _addToBottom() {
    Future.delayed(
      Duration(seconds: 2),
      () => setState(
        () {
          list.addAll(
            List<int>.generate(10, (i) => list.length + i + 1),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (context, index) => ListTile(
        title: Text('Item ${list[index]}'),
      ),
    );
  }
}
