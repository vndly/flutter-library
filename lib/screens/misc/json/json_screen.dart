import 'dart:convert';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/json/automatic/person.dart';
import 'package:flutter_library/screens/misc/json/manual/employee.dart';

class JsonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = Person.fromJson(jsonDecode('''
        {
          "name": "John Doe",
          "email": "john.doe@email.com",
          "address":
          {
            "street": "Fake street",
            "number": 123
          },
          "children":
          [
            {
              "name": "Johnny Doe",
              "email": "johnny.doe@email.com"
            },
            {
              "name": "Jena Doe",
              "email": "jena.doe@email.com"
            }
          ]
        }
        '''));

    final employee = Employee.fromJson(JsonData('''
        {
          "name": "John Doe",
          "email": "john.doe@email.com",
          "office":
          {
            "address": "Fake street 123",
            "numberOfEmployees": 100
          },
          "subordinates":
          [
            {
              "name": "Johnny Doe",
              "email": "johnny.doe@email.com"
            },
            {
              "name": "Jena Doe",
              "email": "jena.doe@email.com"
            }
          ]
        }
        '''));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Json'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                prettyPrint(person.toJson()),
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                prettyPrint(employee.toJson()),
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String prettyPrint(Map<String, dynamic> json) {
    const encoder = JsonEncoder.withIndent('    ');

    return encoder.convert(json);
  }
}
