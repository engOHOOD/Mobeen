// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewFormModel _$ViewFormModelFromJson(Map<String, dynamic> json) =>
    _ViewFormModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ViewFormModelToJson(_ViewFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
