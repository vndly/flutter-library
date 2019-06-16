import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Title'),
                    content: Text('Content'),
                    actions: [
                      FlatButton(
                        child: Text(
                          'Cancel'.toUpperCase(),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      FlatButton(
                        child: Text(
                          'Accept'.toUpperCase(),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                });
          },
          child: Text('Open alert'),
        ),
      ),
    );
  }
}
