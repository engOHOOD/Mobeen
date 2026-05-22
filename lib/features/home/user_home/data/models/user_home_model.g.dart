// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserHomeModel _$UserHomeModelFromJson(Map<String, dynamic> json) =>
    _UserHomeModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$UserHomeModelToJson(_UserHomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
