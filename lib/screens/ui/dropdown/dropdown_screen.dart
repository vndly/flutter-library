import 'package:flutter/material.dart';

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  List<WeekDay> days = [
    WeekDay(1, 'Monday'),
    WeekDay(2, 'Tuesday'),
    WeekDay(3, 'Wednesday'),
    WeekDay(4, 'Thursday'),
    WeekDay(5, 'Friday'),
    WeekDay(6, 'Saturday'),
    WeekDay(7, 'Sunday')
  ];
  WeekDay selectedDay;

  List<DropdownMenuItem<WeekDay>> _buildDropdownMenuItems() =>
      days.map((d) => DropdownMenuItem(value: d, child: Text(d.name))).toList();

  void _changedDropDownItem(WeekDay newSelectedDay) {
    setState(() {
      selectedDay = newSelectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown'),
      ),
      body: Center(
        child: DropdownButton<WeekDay>(
          value: selectedDay,
          items: _buildDropdownMenuItems(),
          onChanged: _changedDropDownItem,
        ),
      ),
    );
  }
}

class WeekDay {
  final int index;
  final String name;

  WeekDay(this.index, this.name);

  @override
  String toString() {
    return name;
  }
}
