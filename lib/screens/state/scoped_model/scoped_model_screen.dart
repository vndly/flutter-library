import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ScopedState(ScopedData(0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scoped Model'),
        ),
        body: Center(
          child: TextCounter(),
        ),
        floatingActionButton: ButtonCounter(),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedState>(
      builder: (context, _, model) => Text(
            '${model.data.counter}',
            style: Theme.of(context).textTheme.display1,
          ),
    );
  }
}

class ButtonCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedState>(
      rebuildOnChange: false,
      builder: (context, _, model) => FloatingActionButton(
            onPressed: model.onIncrementCounter,
            child: Icon(Icons.add),
          ),
    );
  }
}

class ScopedState extends Model {
  ScopedData _data;

  ScopedState(this._data);

  ScopedData get data => _data;

  void onIncrementCounter() {
    _data = _data.increment();
    notifyListeners();
  }
}

@immutable
class ScopedData {
  final int counter;

  ScopedData(this.counter);

  ScopedData increment() => ScopedData(counter + 1);
}
