import 'package:flutter/material.dart';
import 'mvp_screen.dart';

class MvpView extends StatelessWidget
{
  final MvpScreen widget;
  final MvpState state;

  MvpView(this.widget, this.state);

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