import 'package:flutter/material.dart';

class DatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    MaterialLocalizations.of(context).backButtonTooltip;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dates'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${now.toUtc().toIso8601String()}'),
            Text('${DateTime.parse('2019-06-19T12:34:56.789+02:00')}'),
          ],
        ),
      ),
    );
  }

  static String format(DateTime dateTime) => dateTime.toUtc().toIso8601String();

  static DateTime parse(String value) => DateTime.parse(value);
}
