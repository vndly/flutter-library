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
      const PageItem('Page 1', Colors.red),
      const PageItem('Page 2', Colors.green),
      const PageItem('Page 3', Colors.blue),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
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

  const PageItem(this.title, this.color);
}
