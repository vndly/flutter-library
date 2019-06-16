import 'package:flutter/material.dart';
import 'mvp_screen.dart';

class MvpView extends StatelessWidget
{
  final MvpState state;

  MvpView(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.model.title),
      ),
      body: Center(
        child: Text(
          '${state.model.counter}',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.event.onIncrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}