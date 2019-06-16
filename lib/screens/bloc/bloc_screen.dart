import 'dart:async';
import 'package:flutter/material.dart';

final bloc = Bloc(ScopedData(0));

class BlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model'),
      ),
      body: Center(
        child: TextCounter(),
      ),
      floatingActionButton: ButtonCounter(),
    );
  }
}

class TextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc._output.stream,
      initialData: 0,
      builder: (context, snapshot) => Text(
            '${snapshot.data}',
            style: Theme.of(context).textTheme.display1,
          ),
    );
  }
}

class ButtonCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: bloc.onIncrementCounter,
      child: Icon(Icons.add),
    );
  }
}

class Bloc {
  ScopedData _data;

  final _input = StreamController<Null>();
  final _output = StreamController<int>();

  Bloc(this._data) {
    _input.stream.listen((data) {
      _data = _data.increment();
      _output.add(_data.counter);
    });
  }

  void onIncrementCounter() {
    _input.sink.add(null);
  }

  void close() {
    _input.close();
  }
}

@immutable
class ScopedData {
  final int counter;

  ScopedData(this.counter);

  ScopedData increment() => ScopedData(counter + 1);
}
