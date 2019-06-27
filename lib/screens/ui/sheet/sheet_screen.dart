import 'package:flutter/material.dart';

class SheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheet'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(
                    child: const Text('This is a sheet'),
                  );
                });
          },
          child: const Text('Open sheet'),
        ),
      ),
    );
  }
}
