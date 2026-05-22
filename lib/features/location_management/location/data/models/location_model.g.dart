// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    _LocationModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      nationalAddress: json['national_address'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: $enumDecode(_$LocationStatusEnumMap, json['status']),
      hajjCode: json['hajj_code'] as String?,
      hajjNationality: json['hajj_nationality'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(_LocationModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': instance.name,
      'national_address': instance.nationalAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': _$LocationStatusEnumMap[instance.status]!,
      'hajj_code': instance.hajjCode,
      'hajj_nationality': instance.hajjNationality,
    };

const _$LocationStatusEnumMap = {
  LocationStatus.active: 'active',
  LocationStatus.disabled: 'disabled',
};
