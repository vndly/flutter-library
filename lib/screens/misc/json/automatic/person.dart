import 'package:flutter_library/screens/misc/json/automatic/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final String email;
  final Address address;
  final List<Person> children;

  Person(this.name, this.email, this.address, this.children);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
