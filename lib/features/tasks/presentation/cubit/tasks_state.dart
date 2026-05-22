import 'package:equatable/equatable.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';

abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object?> get props => [];
}

class TasksInitialState extends TasksState {}
class TasksLoadingState extends TasksState {}
class GetResearchersSuccessState extends TasksState {}
class TasksActionSuccessState extends TasksState {}
class GetTasksSuccessState extends TasksState {
  final List<TasksEntity> tasks;

  const GetTasksSuccessState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TasksErrorState extends TasksState {
  final String message;
  const TasksErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

