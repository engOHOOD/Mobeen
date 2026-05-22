// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslateModel _$TranslateModelFromJson(Map<String, dynamic> json) =>
    _TranslateModel(
      inputText: json['inputText'] as String,
      translatedText: json['translatedText'] as String,
      detectedLanguage: json['detectedLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
    );

Map<String, dynamic> _$TranslateModelToJson(_TranslateModel instance) =>
    <String, dynamic>{
      'inputText': instance.inputText,
      'translatedText': instance.translatedText,
      'detectedLanguage': instance.detectedLanguage,
      'targetLanguage': instance.targetLanguage,
    };
