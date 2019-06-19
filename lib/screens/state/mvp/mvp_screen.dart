import 'package:flutter/material.dart';
import 'package:flutter_library/screens/state/mvp/mvp_view.dart';

class MvpScreen extends StatefulWidget {
  final String title;

  MvpScreen(this.title);

  @override
  MvpEvents createState() => MvpEvents(MvpModel(this.title, 0));
}

class MvpEvents extends State {
  MvpModel _model;

  MvpEvents(this._model);

  void onIncrementCounter() => setState(() => _model = _model.increment());

  @override
  Widget build(BuildContext context) => MvpView(MvpState(this, _model));
}

class MvpState
{
  MvpEvents event;
  MvpModel model;

  MvpState(this.event, this.model);
}

@immutable
class MvpModel {
  final String title;
  final int counter;

  MvpModel(this.title, this.counter);

  MvpModel increment() => MvpModel(title, counter + 1);
}
