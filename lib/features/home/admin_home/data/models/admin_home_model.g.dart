// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminHomeModel _$AdminHomeModelFromJson(Map<String, dynamic> json) =>
    _AdminHomeModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AdminHomeModelToJson(_AdminHomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
