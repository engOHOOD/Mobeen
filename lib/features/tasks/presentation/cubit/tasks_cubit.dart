import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';
import 'package:mobeen/features/tasks/domain/use_cases/tasks_use_case.dart';
import 'package:mobeen/features/tasks/presentation/cubit/tasks_state.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/features/team/domain/use_cases/team_use_case.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksUseCase _tasksUseCase;
List<UserEntity> researchers = [];
  TasksCubit(this._tasksUseCase, this._teamUseCase) : super(TasksInitialState()){
       getTasks();
         getResearchers();

  }
  final TeamUseCase _teamUseCase;


  // 🟢 ADD TASK
  Future<void> assignTask(TasksEntity task) async {
    emit(TasksLoadingState());
    final result = await _tasksUseCase.assignTask(task);
    result.when(
      (success) {
        emit(TasksActionSuccessState());
        getTasks();
      },
     (whenError) {
        emit(TasksErrorState(message: whenError.message));
      },
    );
  }

  // 🔵 GET TASKS
  Future<void> getTasks() async {
    final result = await _tasksUseCase.getTasks();
    result.when(
      (success) {
        emit(GetTasksSuccessState(success));
      },
      (whenError) {
        emit(TasksErrorState(message: whenError.message));
      },
    );
  }

  // 🟠 UPDATE TASK
  Future<void> updateTask(TasksEntity task) async {
    emit(TasksLoadingState());
    final result = await _tasksUseCase.updateTask(task);
    result.when(
      (success) {
        emit(TasksActionSuccessState());
        getTasks();
      },
      (whenError) {
        emit(TasksErrorState(message: whenError.message));
      },
    );
  }

  // 🔴 DELETE TASK
  Future<void> deleteTask(String id) async {
    emit(TasksLoadingState());
    final result = await _tasksUseCase.deleteTask(id);
    result.when(
      (success) {
        emit(TasksActionSuccessState());
        getTasks();
      },
       (whenError) {
        emit(TasksErrorState(message: whenError.message));
      },
    );
  }

Future<void> getResearchers() async {
  final result = await _teamUseCase.getTeam();

  result.when(
    (success) {
      researchers = success;
      emit(GetResearchersSuccessState());
    },
    (whenError) {
      emit(TasksErrorState(message: whenError.message));
    },
  );
}
  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
