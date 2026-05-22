import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';
import 'package:mobeen/features/tasks/domain/repositories/tasks_repository_domain.dart';

@lazySingleton
class TasksUseCase {
  final TasksRepositoryDomain _repositoryData;

  TasksUseCase(this._repositoryData);

  Future<Result<List<TasksEntity>, Failure>> getTasks() {
    return _repositoryData.getTasks();
  }
  Future<Result<void, Failure>> assignTask(TasksEntity task) {
    return _repositoryData.assignTask(task);
  }
  Future<Result<void, Failure>> updateTask(TasksEntity task) {
    return _repositoryData.updateTask(task);
  }
  Future<Result<void, Failure>> deleteTask(String id) {
    return _repositoryData.deleteTask(id);
  }
}
