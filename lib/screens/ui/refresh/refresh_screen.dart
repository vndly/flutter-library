import 'package:flutter/material.dart';
import 'package:dafluta/dafluta.dart';

class RefreshScreen extends StatefulWidget {
  @override
  _RefreshScreenState createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    InitCallback.register(_onLoad);
  }

  Future _onLoad() async {
    setState(() {
      _items = [];
    });

    final List<String> items = await Future.delayed(Duration(seconds: 3),
        () => List<String>.generate(20, (index) => 'Item $index'));

    if (mounted) {
      setState(() {
        _items = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh'),
      ),
      body: RefreshIndicator(
        onRefresh: _onLoad,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(_items[index]),
              ),
        ),
      ),
    );
  }
}
