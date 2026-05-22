// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FillFormModel _$FillFormModelFromJson(Map<String, dynamic> json) =>
    _FillFormModel(
      id: json['id'] as String,
      formId: json['formId'] as String,
      questionId: json['questionId'] as String,
      userId: json['userId'] as String,
      answer: json['answer'] as List<dynamic>,
    );

Map<String, dynamic> _$FillFormModelToJson(_FillFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'formId': instance.formId,
      'questionId': instance.questionId,
      'userId': instance.userId,
      'answer': instance.answer,
    };
