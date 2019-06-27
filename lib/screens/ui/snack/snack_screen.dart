import 'package:flutter/material.dart';

class SnackScreen extends StatelessWidget {
  void showSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a snack message'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack'),
      ),
      body: Builder(
        builder: (context) => Center(
              child: RaisedButton(
                onPressed: () => showSnack(context),
                child: const Text('Show snack'),
              ),
            ),
      ),
    );
  }
}
