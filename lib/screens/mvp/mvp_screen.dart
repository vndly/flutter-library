import 'package:flutter/material.dart';
import 'mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title;

  MvpScreen(this.title);

  @override
  MvpState createState() => MvpState(MvpModel(0));
}

class MvpState<MvpModel, MvpScreen> extends BaseEvent {
  MvpState(state) : super(state);

  void onIncrementCounter() => update(state.increment);

  @override
  Widget build(BuildContext context) => MvpView(widget, this, state);
}

abstract class BaseEvent<S, W extends StatefulWidget> extends State<W> {
  S state;

  BaseEvent(this.state);

  void update(Function function) => setState(() => state = function());
}

@immutable
class MvpModel {
  final int _counter;

  MvpModel(this._counter);

  int counter() => _counter;

  MvpModel increment() => MvpModel(_counter + 1);
}
