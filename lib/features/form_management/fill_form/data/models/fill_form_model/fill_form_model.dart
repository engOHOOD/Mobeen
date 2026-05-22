import 'package:mobeen/features/form_management/fill_form/domain/entities/fill_form_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'fill_form_model.freezed.dart';
part 'fill_form_model.g.dart';

@freezed
abstract class FillFormModel with _$FillFormModel {
  const factory FillFormModel({
    required String id,
    required String formId,
    required String questionId,
    required String userId,
    required List<dynamic> answer,
  }) = _FillFormModel;

  factory FillFormModel.fromJson(Map<String, Object?> json) =>
      _$FillFormModelFromJson(json);
}

extension FillFormModelMapper on FillFormModel {
  FillFormEntity toEntity() {
    return FillFormEntity(
      id: id,
      formId: formId,
      questionId: questionId,
      userId: userId,
      answer: answer,
    );
  }
}
