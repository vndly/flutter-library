// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
      json['name'] as String,
      json['email'] as String,
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['children'] as List)
          ?.map((e) =>
              e == null ? null : Person.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'children': instance.children
    };
