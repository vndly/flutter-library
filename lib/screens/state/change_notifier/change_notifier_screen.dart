import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ScopedState(const ScopedData(0)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Notifier'),
        ),
        body: Center(
          child: TextCounter2(),
        ),
        floatingActionButton: ButtonCounter(),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScopedState>(
      builder: (context, model, _) => Text(
            '${model.data.counter}',
            style: Theme.of(context).textTheme.display1,
          ),
    );
  }
}

// Alternative using Provider.of()
class TextCounter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ScopedState>(context);

    return Text(
      '${model.data.counter}',
      style: Theme.of(context).textTheme.display1,
    );
  }
}

class ButtonCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScopedState>(
      builder: (context, model, _) => FloatingActionButton(
            onPressed: model.onIncrementCounter,
            child: const Icon(Icons.add),
          ),
    );
  }
}

class ScopedState extends ChangeNotifier {
  ScopedData _data;

  ScopedState(this._data);

  ScopedData get data => _data;

  void onIncrementCounter() {
    _data = _data.increment();
    notifyListeners();
  }
}

class ScopedData {
  final int counter;

  const ScopedData(this.counter);

  ScopedData increment() => ScopedData(counter + 1);
}
