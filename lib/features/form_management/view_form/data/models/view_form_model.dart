import 'package:mobeen/features/form_management/view_form/domain/entities/view_form_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_form_model.freezed.dart';
part 'view_form_model.g.dart';

@freezed
abstract class ViewFormModel with _$ViewFormModel {
  const factory ViewFormModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ViewFormModel;

  factory ViewFormModel.fromJson(Map<String, Object?> json) => _$ViewFormModelFromJson(json);
}



extension ViewFormModelMapper on ViewFormModel {
  ViewFormEntity toEntity() {
    return ViewFormEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
