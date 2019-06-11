import 'package:flutter/material.dart';
import 'mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title = 'MVP';

  @override
  MvpEvent createState() => MvpEvent();
}

class MvpEvent extends State<MvpScreen> {
  MvpState state = MvpState(0);

  void onIncrementCounter() {
    setState(() => state = state.increment());
  }

  @override
  Widget build(BuildContext context) {
    return MvpView(widget, this, state);
  }
}

@immutable
class MvpState {
  final int _counter;

  MvpState(this._counter);

  int counter() => _counter;

  MvpState increment() {
    return MvpState(_counter + 1);
  }
}
