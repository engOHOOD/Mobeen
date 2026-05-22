import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobeen/core/common/models/form_model/form_model.dart';
import 'package:mobeen/core/common/models/question_model/question_model.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/generate_form_entity.dart';
part 'generate_form_model.freezed.dart';
part 'generate_form_model.g.dart';

@freezed
abstract class GenerateFormModel with _$GenerateFormModel {
  const factory GenerateFormModel({
    required FormModel form,
    required List<QuestionModel> questions,
  }) = _GenerateFormModel;

  factory GenerateFormModel.fromJson(Map<String, Object?> json) =>
      _$GenerateFormModelFromJson(json);
}

extension GenerateFormModelMapper on GenerateFormModel {
  GenerateFormEntity toEntity() {
    return GenerateFormEntity(
      form: form.toEntity(),
      questions: questions.map((e) => e.toEntity()).toList(),
    );
  }
}
