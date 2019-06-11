import 'package:flutter/material.dart';
import 'mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title = 'MVP';

  @override
  MvpEvent createState() => MvpEvent();
}

class MvpEvent extends State<MvpScreen> {
  MvpState state = MvpState(0);

  void onIncrementCounter() => update(state.increment);

  void update(Function function) => setState(() => state = function());

  @override
  Widget build(BuildContext context) => MvpView(widget, this, state);
}

@immutable
class MvpState {
  final int _counter;

  MvpState(this._counter);

  int counter() => _counter;

  MvpState increment() => MvpState(_counter + 1);
}
