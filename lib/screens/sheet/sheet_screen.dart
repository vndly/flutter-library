import 'package:flutter/material.dart';

class SheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sheet'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(
                    child: Text('This is a sheet'),
                  );
                });
          },
          child: Text('Open sheet'),
        ),
      ),
    );
  }
}
