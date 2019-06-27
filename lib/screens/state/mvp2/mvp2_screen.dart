import 'package:flutter/material.dart';
import 'package:flutter_library/screens/state/mvp2/mvp2_model.dart';
import 'package:flutter_library/screens/state/mvp2/mvp2_state.dart';
import 'package:flutter_library/screens/state/mvp2/mvp2_view.dart';

class Mvp2Screen extends StatefulWidget {
  final String title;

  const Mvp2Screen(this.title);

  @override
  State<StatefulWidget> createState() =>
      Mvp2State(Mvp2View(), Mvp2Model(title, 0));
}

//------------------------------------------------------------------------------

abstract class ExtraView<M, S> {
  Widget build(BuildContext context, M model, S state);
}

abstract class ExtraState<V extends ExtraView, M> extends State {
  final V _view;
  M model;

  ExtraState(this._view, this.model);

  @override
  Widget build(BuildContext context) => _view.build(context, model, this);
}
