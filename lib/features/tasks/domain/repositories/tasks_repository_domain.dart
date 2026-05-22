import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';

abstract class TasksRepositoryDomain {
Future<Result<List<TasksEntity>, Failure>> getTasks();
  Future<Result<void, Failure>> assignTask(TasksEntity task);
  Future<Result<void, Failure>> updateTask(TasksEntity task);
  Future<Result<void, Failure>> deleteTask(String taskId);
}
