import 'package:flutter/material.dart';
import 'mvp_screen.dart';

class MvpView extends StatelessWidget
{
  final MvpState state;
  final MvpModel model;

  MvpView(this.state, this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: Center(
        child: Text(
          '${model.counter}',
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