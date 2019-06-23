import 'dart:convert';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';

class EnumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var day = dayParser('monday');
    var month = Month.parse('june');

    return Scaffold(
      appBar: AppBar(
        title: Text('Enums'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.toString(),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              '${month.name} (${month.value})',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String prettyPrint(Map<String, dynamic> json) {
    JsonEncoder encoder = JsonEncoder.withIndent('    ');

    return encoder.convert(json);
  }
}

Day dayParser(String value, {Day defaultValue}) {
  return Enums.parse(Day.values, value, defaultValue: defaultValue);
}

enum Day { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

class Month {
  static const JANUARY = const Month._('JANUARY', 1);
  static const FEBRUARY = const Month._('FEBRUARY', 2);
  static const MARCH = const Month._('MARCH', 3);
  static const APRIL = const Month._('APRIL', 4);
  static const MAY = const Month._('MAY', 5);
  static const JUNE = const Month._('JUNE', 6);
  static const JULY = const Month._('JULY', 7);
  static const AUGUST = const Month._('AUGUST', 8);
  static const SEPTEMBER = const Month._('SEPTEMBER', 9);
  static const OCTOBER = const Month._('OCTOBER', 10);
  static const NOVEMBER = const Month._('NOVEMBER', 1);
  static const DECEMBER = const Month._('DECEMBER', 12);

  final String name;
  final int value;

  const Month._(this.name, this.value);

  static List<Month> get values => [
        JANUARY,
        FEBRUARY,
        MARCH,
        APRIL,
        MAY,
        JUNE,
        JULY,
        AUGUST,
        SEPTEMBER,
        OCTOBER,
        NOVEMBER,
        DECEMBER
      ];

  static Month parse(String value, {Month defaultValue}) {
    for (var month in values) {
      if (month.name.toLowerCase() == value.toLowerCase()) {
        return month;
      }
    }

    return defaultValue;
  }
}
