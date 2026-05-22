// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiveLocationModel _$LiveLocationModelFromJson(Map<String, dynamic> json) =>
    _LiveLocationModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LiveLocationModelToJson(_LiveLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
