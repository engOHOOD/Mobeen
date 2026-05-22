// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateFormModel _$GenerateFormModelFromJson(Map<String, dynamic> json) =>
    _GenerateFormModel(
      form: FormModel.fromJson(json['form'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenerateFormModelToJson(_GenerateFormModel instance) =>
    <String, dynamic>{'form': instance.form, 'questions': instance.questions};
