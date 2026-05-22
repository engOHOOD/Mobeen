import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/common/models/question_model/question_model.dart';
part 'form_model.freezed.dart';
part 'form_model.g.dart';

@freezed
abstract class FormModel with _$FormModel {
  @JsonSerializable(fieldRename: .snake)
  const factory FormModel({
    required String id,
    required String userId,
    required String title,
    required String description,
    required String? qrCodeUrl,
    required bool isEnabled,
    required bool isCompleted,
    required int target,
    required int achieved,
  }) = _FormModel;

  factory FormModel.fromJson(Map<String, Object?> json) =>
      _$FormModelFromJson(json);
}

extension FormModelMapper on FormModel {
  FormEntity toEntity() {
    return FormEntity(
      id: id,
      userId: userId,
      title: title,
      description: description,
      qrCodeUrl: qrCodeUrl,
      isEnabled: isEnabled,
      isCompleted: isCompleted,
      target: target,
      achieved: achieved,
    );
  }
}
