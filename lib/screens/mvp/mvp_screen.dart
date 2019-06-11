import 'package:flutter/material.dart';
import 'mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title;

  MvpScreen(this.title);

  @override
  MvpState createState() => MvpState(MvpModel(this.title, 0));
}

class MvpState<MvpModel> extends BaseEvent {
  MvpState(model) : super(model);

  void onIncrementCounter() => update(_model.increment);

  @override
  Widget build(BuildContext context) => MvpView(this, _model);
}

abstract class BaseEvent<S> extends State {
  S _model;

  BaseEvent(this._model);

  void update(Function function) => setState(() => _model = function());
}

@immutable
class MvpModel {
  final String title;
  final int counter;

  MvpModel(this.title, this.counter);

  MvpModel increment() => MvpModel(title, counter + 1);
}
