import 'dart:convert';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';

class EnumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final day = dayParser('monday');
    final month = Month.parse('june');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enums'),
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
    const encoder = JsonEncoder.withIndent('    ');

    return encoder.convert(json);
  }
}

Day dayParser(String value, {Day defaultValue}) {
  return Enums.parse(Day.values, value, defaultValue: defaultValue);
}

enum Day { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

class Month {
  static const JANUARY = Month._('JANUARY', 1);
  static const FEBRUARY = Month._('FEBRUARY', 2);
  static const MARCH = Month._('MARCH', 3);
  static const APRIL = Month._('APRIL', 4);
  static const MAY = Month._('MAY', 5);
  static const JUNE = Month._('JUNE', 6);
  static const JULY = Month._('JULY', 7);
  static const AUGUST = Month._('AUGUST', 8);
  static const SEPTEMBER = Month._('SEPTEMBER', 9);
  static const OCTOBER = Month._('OCTOBER', 10);
  static const NOVEMBER = Month._('NOVEMBER', 1);
  static const DECEMBER = Month._('DECEMBER', 12);

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
