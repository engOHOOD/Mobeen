// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormModel _$FormModelFromJson(Map<String, dynamic> json) => _FormModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  qrCodeUrl: json['qr_code_url'] as String?,
  isEnabled: json['is_enabled'] as bool,
  isCompleted: json['is_completed'] as bool,
  target: (json['target'] as num).toInt(),
  achieved: (json['achieved'] as num).toInt(),
);

Map<String, dynamic> _$FormModelToJson(_FormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'qr_code_url': instance.qrCodeUrl,
      'is_enabled': instance.isEnabled,
      'is_completed': instance.isCompleted,
      'target': instance.target,
      'achieved': instance.achieved,
    };
