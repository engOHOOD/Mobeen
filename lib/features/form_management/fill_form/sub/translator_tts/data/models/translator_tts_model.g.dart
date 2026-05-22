// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translator_tts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslatorTtsModel _$TranslatorTtsModelFromJson(Map<String, dynamic> json) =>
    _TranslatorTtsModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$TranslatorTtsModelToJson(_TranslatorTtsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
