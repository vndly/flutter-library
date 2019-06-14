import 'package:flutter/material.dart';

class Mvp2Screen extends ExtraPresenter {
  Mvp2Screen(String title)
      : super(
          Mvp2State(Mvp2Model(title, 0)),
          Mvp2View(),
        );
}

@immutable
class Mvp2Model {
  final String title;
  final int counter;

  Mvp2Model(this.title, this.counter);

  Mvp2Model increment() => Mvp2Model(title, counter + 1);
}

class Mvp2State extends ExtraState {
  Mvp2Model model;

  Mvp2State(this.model);

  void onIncrementCounter() => setState(() => model = model.increment());
}

class Mvp2View extends ExtraView<Mvp2State> {
  @override
  Widget build(BuildContext context, Mvp2State state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.model.title),
      ),
      body: Center(
        child: Text(
          '${state.model.counter}',
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

class ExtraPresenter<S extends ExtraState, V extends ExtraView>
    extends StatefulWidget {
  final S state;
  final V view;

  ExtraPresenter(this.state, this.view);

  @override
  ExtraPresenterState createState() => ExtraPresenterState(state, view);
}

class ExtraPresenterState<S extends ExtraState, V extends ExtraView>
    extends State {
  final S state;
  final V view;

  ExtraPresenterState(this.state, this.view);

  @override
  Widget build(BuildContext context) {
    state.addState(this);

    return view.build(context, state);
  }
}

class ExtraState {
  State state;

  void addState(State state) {
    this.state = state;
  }

  void setState(VoidCallback fn) {
    state.setState(fn);
  }
}

abstract class ExtraView<S extends ExtraState> {
  build(BuildContext context, S state);
}

//-------------------------------------------------------------

/*class Presenter2<M> extends InheritedWidget {
  final M model;

  Presenter2({
    @required Widget child,
    this.model,
  }) : super(child: child);

  static Screen of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Screen);
  }

  @override
  bool updateShouldNotify(Presenter2 screen) => model != screen.model;
}*/
