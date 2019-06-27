import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastScreen extends StatelessWidget {
  void showToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: 'This is a toast',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: const Color(0xff555555),
        textColor: Colors.white,
        fontSize: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => showToast(context),
          child: const Text('Show toast'),
        ),
      ),
    );
  }
}
