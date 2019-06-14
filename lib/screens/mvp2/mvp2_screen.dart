import 'package:flutter/material.dart';

class Mvp2Screen extends ExtraPresenter {
  Mvp2Screen(String title)
      : super(
          Mvp2State(
            Mvp2Model(title, 0),
          ),
        );
}

@immutable
class Mvp2Model {
  final String title;
  final int counter;

  Mvp2Model(this.title, this.counter);

  Mvp2Model increment() => Mvp2Model(title, counter + 1);
}

class Mvp2State extends State {
  Mvp2Model _model;

  Mvp2State(this._model);

  void onIncrementCounter() => setState(() => _model = _model.increment());

  @override
  Widget build(BuildContext context) => Mvp2View().build(context, _model, this);
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

//-------------------------------------------------------------

class ExtraPresenter<S extends State> extends StatefulWidget {
  final S state;

  ExtraPresenter(this.state);

  @override
  S createState() => state;
}

abstract class ExtraView<M, S extends State> {
  build(BuildContext context, M mode, S state);
}
