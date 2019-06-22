import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String street;
  final num number;

  Address(this.street, this.number);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
