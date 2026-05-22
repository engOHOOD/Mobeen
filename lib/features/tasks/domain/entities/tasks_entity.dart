import 'package:equatable/equatable.dart';
import 'package:mobeen/core/constants/app_enums.dart';

class TasksEntity extends Equatable {
  final String? id;
  final String researcherId;
  final String supervisorId;
  final String locationId;
  final ShiftType shift;
  final DateTime taskDate;
  final TaskStatus status;

  const TasksEntity({
    this.id,
    required this.researcherId,
    required this.supervisorId,
    required this.locationId,
    required this.shift,
    required this.taskDate,
    this.status = TaskStatus.assigned ,
  });

  @override
  List<Object?> get props => [id, researcherId, supervisorId,locationId,shift,taskDate,status];
}
