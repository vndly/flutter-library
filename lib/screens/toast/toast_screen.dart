import 'package:flutter/material.dart';

class ToastScreen extends StatelessWidget {
  void showToast(BuildContext context) {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('This is a toast message'),
    ));
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
