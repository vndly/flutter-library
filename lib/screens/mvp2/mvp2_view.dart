import 'package:flutter/material.dart';
import 'mvp2_model.dart';
import 'mvp2_screen.dart';
import 'mvp2_state.dart';

class Mvp2View extends ExtraView<Mvp2Model, Mvp2State> {
  @override
  Widget build(BuildContext context, Mvp2Model model, Mvp2State state) {
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
        onPressed: () => state.onIncrementCounter(),
        child: Icon(Icons.add),
      ),
    );
  }
}
