// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistersModel _$RegistersModelFromJson(Map<String, dynamic> json) {
  return RegistersModel(
   email: json['email'] as String,
   id: json['id'] as String,
    name:json['name'] as String,
   password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegistersModelToJson(RegistersModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'id': instance.id,
    };
