import 'package:flutter/material.dart';
import 'mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title = 'MVP';

  @override
  MvpState createState() => MvpState();
}

class MvpState extends State<MvpScreen> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int counter() => _counter;

  @override
  Widget build(BuildContext context) {
    return MvpView(widget, this);
  }
}
