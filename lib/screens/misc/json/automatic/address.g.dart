// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(json['street'] as String, json['number'] as num);
}

Map<String, dynamic> _$AddressToJson(Address instance) =>
    <String, dynamic>{'street': instance.street, 'number': instance.number};
