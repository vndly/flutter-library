import 'package:flutter/material.dart';
import 'package:flutter_library/screens/state/mvp/mvp_screen.dart';

class MvpView extends StatelessWidget {
  final MvpState state;

  const MvpView(this.state);

  @override
  Widget build(BuildContext context) {
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
        onPressed: state.event.onIncrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
