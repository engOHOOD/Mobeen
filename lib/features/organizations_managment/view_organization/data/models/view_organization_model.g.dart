// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewOrganizationModel _$ViewOrganizationModelFromJson(
  Map<String, dynamic> json,
) => _ViewOrganizationModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  nationalAddress: json['national_address'] as String?,
  organizationLogo: json['organization_logo'] as String?,
);

Map<String, dynamic> _$ViewOrganizationModelToJson(
  _ViewOrganizationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'national_address': instance.nationalAddress,
  'organization_logo': instance.organizationLogo,
};
