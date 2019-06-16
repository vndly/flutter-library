import 'package:flutter/material.dart';

class ToastScreen extends StatelessWidget {
  void showToast(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a toast message'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast'),
      ),
      body: Builder(
        builder: (context) => Center(
              child: RaisedButton(
                onPressed: () => showToast(context),
                child: Text('Show toast'),
              ),
            ),
      ),
    );
  }
}
