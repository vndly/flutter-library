import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  final List<WeekDay> days = [
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
        title: const Text('Dropdown example'),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Select day:'),
                const HBox(15),
                DropdownButton<WeekDay>(
                  value: selectedDay,
                  items: _buildDropdownMenuItems(),
                  onChanged: _changedDropDownItem,
                ),
              ],
            ),
            Text(
                'Selected: ${(selectedDay != null) ? selectedDay.name : 'None'}')
          ],
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
