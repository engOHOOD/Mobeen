// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksModel _$TasksModelFromJson(Map<String, dynamic> json) => _TasksModel(
  id: json['id'] as String?,
  researcherId: json['researcher_id'] as String,
  supervisorId: json['supervisor_id'] as String,
  locationId: json['location_id'] as String,
  shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
  taskDate: DateTime.parse(json['task_date'] as String),
  status: $enumDecode(_$TaskStatusEnumMap, json['status']),
);

Map<String, dynamic> _$TasksModelToJson(_TasksModel instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'researcher_id': instance.researcherId,
      'supervisor_id': instance.supervisorId,
      'location_id': instance.locationId,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'task_date': instance.taskDate.toIso8601String(),
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.evening: 'evening',
};

const _$TaskStatusEnumMap = {
  TaskStatus.assigned: 'assigned',
  TaskStatus.completed: 'completed',
  TaskStatus.absent: 'absent',
};
