import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageItem('Page 1', Colors.red),
      PageItem('Page 2', Colors.green),
      PageItem('Page 3', Colors.blue),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Page View'),
      ),
      body: PageView.builder(
        itemBuilder: (context, position) {
          return _page(pages[position]);
        },
        itemCount: pages.length,
      ),
    );
  }
}

@immutable
class PageItem {
  final String title;
  final Color color;

  PageItem(this.title, this.color);
}
