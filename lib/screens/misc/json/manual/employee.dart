import 'package:flutter_library/screens/misc/json/manual/office.dart';
import 'package:dafluta/dafluta.dart';

class Employee {
  final String name;
  final String email;
  final Office office;
  final List<Employee> subordinates;

  Employee(this.name, this.email, this.office, this.subordinates);

  static Employee fromJson(JsonData json) => Employee(
        json.string('name'),
        json.string('email'),
        json.object('office', Office.fromJson),
        json.list('subordinates', Employee.fromJson),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    if (name != null) {
      map['name'] = name;
    }

    if (email != null) {
      map['email'] = email;
    }

    if (office != null) {
      map['office'] = office.toJson();
    }

    map['subordinates'] = (subordinates != null)
        ? subordinates.map((s) => s.toJson()).toList()
        : [];

    return map;
  }
}
