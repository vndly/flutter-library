import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/json/automatic/person.dart';

class JsonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var person1 = Person.fromJson(
        jsonDecode('{"name": "John Doe", "email": "john.doe@email.com", ""}'));

    return Scaffold(
      appBar: AppBar(
        title: Text('Json'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(person1.toJson().toString()),
            ],
          ),
        ),
      ),
    );
  }
}
