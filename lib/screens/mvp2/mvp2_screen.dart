import 'package:flutter/material.dart';

class Mvp2Screen extends StatefulWidget {
  final String title;

  Mvp2Screen(this.title);

  @override
  State<StatefulWidget> createState() =>
      Mvp2State(Mvp2View(), Mvp2Model(title, 0));
}

@immutable
class Mvp2Model {
  final String title;
  final int counter;

  Mvp2Model(this.title, this.counter);

  Mvp2Model increment() => Mvp2Model(title, counter + 1);
}

class Mvp2State extends ExtraState<Mvp2View, Mvp2Model> {
  Mvp2State(Mvp2View view, Mvp2Model model) : super(view, model);

  void onIncrementCounter() => setState(() => _model = _model.increment());
}

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

abstract class ExtraView<M, S> {
  Widget build(BuildContext context, M model, S state);
}

abstract class ExtraState<V extends ExtraView, M> extends State {
  V _view;
  M _model;

  ExtraState(this._view, this._model);

  @override
  Widget build(BuildContext context) => _view.build(context, _model, this);
}
