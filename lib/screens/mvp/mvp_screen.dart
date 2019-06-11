import 'package:flutter/material.dart';
import 'mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title;

  MvpScreen(this.title);

  @override
  MvpState createState() => MvpState(MvpModel(this.title, 0));
}

class MvpState<MvpModel, MvpScreen> extends BaseEvent {
  MvpState(state) : super(state);

  void onIncrementCounter() => update(state.increment);

  @override
  Widget build(BuildContext context) => MvpView(this, state);
}

abstract class BaseEvent<S, W extends StatefulWidget> extends State<W> {
  S state;

  BaseEvent(this.state);

  void update(Function function) => setState(() => state = function());
}

@immutable
class MvpModel {
  final String title;
  final int counter;

  MvpModel(this.title, this.counter);

  MvpModel increment() => MvpModel(title, counter + 1);
}
