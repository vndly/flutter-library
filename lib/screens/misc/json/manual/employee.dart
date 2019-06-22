import 'package:flutter_library/screens/misc/json/manual/office.dart';

class Employee
{
  final String name;
  final String email;
  final Office office;
  final List<Employee> subordinates;

  Employee(this.name, this.email, this.office, this.subordinates);
}