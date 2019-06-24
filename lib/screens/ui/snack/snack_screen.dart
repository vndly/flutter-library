import 'package:flutter/material.dart';

class SnackScreen extends StatelessWidget {
  void showSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a snack message'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack'),
      ),
      body: Builder(
        builder: (context) => Center(
              child: RaisedButton(
                onPressed: () => showSnack(context),
                child: Text('Show snack'),
              ),
            ),
      ),
    );
  }
}
