import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobeen/core/common/entity/question_entity.dart';
part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  @JsonSerializable(fieldRename: .snake)
  const factory QuestionModel({
    required String id,
    required String formId,
    required String question,
    required String type,
    required int sort,
    @Default(false) bool isRequired,
    @Default([]) List<String> options,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, Object?> json) =>
      _$QuestionModelFromJson(json);
}

extension QuestionModelMapper on QuestionModel {
  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id,
      formId: formId,
      question: question,
      type: type,
      sort: sort,
      isRequired: isRequired,
      options: options,
    );
  }
}
