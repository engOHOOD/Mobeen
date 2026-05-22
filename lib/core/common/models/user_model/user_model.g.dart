// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  mustResetPassword: json['must_reset_password'] as bool,
  organisationsId: json['organisations_id'] as String?,
  organisationName: json['organisation_name'] as String?,
  phoneNumber: json['phone_number'] as String?,
  supervisorId: json['supervisor_id'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'must_reset_password': instance.mustResetPassword,
      'organisations_id': instance.organisationsId,
      'organisation_name': instance.organisationName,
      'phone_number': instance.phoneNumber,
      'supervisor_id': ?instance.supervisorId,
    };
