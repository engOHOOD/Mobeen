// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: json['id'] as String,
      formId: json['form_id'] as String,
      question: json['question'] as String,
      type: json['type'] as String,
      sort: (json['sort'] as num).toInt(),
      isRequired: json['is_required'] as bool? ?? false,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'form_id': instance.formId,
      'question': instance.question,
      'type': instance.type,
      'sort': instance.sort,
      'is_required': instance.isRequired,
      'options': instance.options,
    };
