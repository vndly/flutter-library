import 'package:flutter/material.dart';

class MvpScreen extends StatefulWidget {
  final String title = 'MVP';

  @override
  _MvpState createState() => _MvpState();
}

class _MvpState extends State<MvpScreen> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int counter() => _counter;

  @override
  Widget build(BuildContext context) {
    return _MvpView(widget, this);
  }
}

class _MvpView extends StatelessWidget
{
  final MvpScreen widget;
  final _MvpState state;

  _MvpView(this.widget, this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          '${state.counter()}',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}