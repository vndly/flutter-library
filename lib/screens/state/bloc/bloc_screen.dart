import 'dart:async';
import 'package:flutter/material.dart';

final bloc = Bloc(const ScopedData(0));

class BlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoped Model'),
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
      stream: bloc.ouput,
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
      onPressed: () => bloc.input.add(null),
      child: const Icon(Icons.add),
    );
  }
}

class Bloc {
  ScopedData _data;

  final _input = StreamController<void>();
  Sink<void> get input => _input.sink;

  final _output = StreamController<int>();
  Stream<int> get ouput => _output.stream;

  Bloc(this._data) {
    _input.stream.listen((_) {
      _data = _data.increment();
      _output.add(_data.counter);
    });
  }

  void close() {
    _input.close();
  }
}

class ScopedData {
  final int counter;

  const ScopedData(this.counter);

  ScopedData increment() => ScopedData(counter + 1);
}
