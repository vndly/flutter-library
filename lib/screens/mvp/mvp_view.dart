import 'package:flutter/material.dart';
import 'mvp_screen.dart';

class MvpView extends StatelessWidget
{
  final MvpScreen widget;
  final MvpState state;
  final MvpModel model;

  MvpView(this.widget, this.state, this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          '${model.counter()}',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.onIncrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}