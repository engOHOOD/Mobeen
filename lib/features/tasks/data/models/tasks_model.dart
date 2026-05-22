import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_model.freezed.dart';
part 'tasks_model.g.dart';

@freezed
abstract class TasksModel with _$TasksModel {
  @JsonSerializable(fieldRename: .snake)
  const factory TasksModel({
    @JsonKey(includeIfNull: false) 
    String? id,
    required String researcherId,
    required String supervisorId,
    required String locationId,
    required ShiftType shift,
    required DateTime taskDate,
    required TaskStatus status,
  }) = _TasksModel;

  factory TasksModel.fromJson(Map<String, Object?> json) =>
      _$TasksModelFromJson(json);
}

extension TasksModelMapper on TasksModel {
  TasksEntity toEntity() {
    return TasksEntity(
      id: id,
      researcherId: researcherId,
      supervisorId: supervisorId,
      locationId: locationId,
      shift: shift,
      taskDate: taskDate,
      status: status,
    );
  }
}

extension TasksEntityMapper on TasksEntity {
  TasksModel toModel() {
    return TasksModel(
      researcherId: researcherId,
      supervisorId: supervisorId,
      locationId: locationId,
      shift: shift,
      taskDate: taskDate,
      status: status,
    );
  }
}
