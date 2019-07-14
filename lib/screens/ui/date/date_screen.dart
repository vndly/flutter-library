import 'package:flutter/material.dart';

class DateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date'),
        leading: const BackButton(),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            child: const Text('Select date'),
            onPressed: () => _onSelectDate(context),
          ),
          RaisedButton(
            child: const Text('Select time'),
            onPressed: () => _onSelectTime(context),
          ),
        ],
      )),
    );
  }

  Future _onSelectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime.now());

    if (picked != null) {
      print(picked.toIso8601String());
    }
  }

  Future _onSelectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 34),
    );

    if (picked != null) {
      print(picked.toString());
    }
  }
}
