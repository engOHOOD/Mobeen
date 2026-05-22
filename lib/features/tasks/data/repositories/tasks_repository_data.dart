
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/tasks/domain/entities/tasks_entity.dart';

import 'package:mobeen/features/tasks/data/datasources/tasks_remote_data_source.dart';
import 'package:mobeen/features/tasks/data/models/tasks_model.dart';
import 'package:mobeen/features/tasks/domain/repositories/tasks_repository_domain.dart';

@LazySingleton(as: TasksRepositoryDomain)
class TasksRepositoryData implements TasksRepositoryDomain{
  final BaseTasksRemoteDataSource remoteDataSource;


  TasksRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<TasksEntity>, Failure>> getTasks() async {
    try {
      final response = await remoteDataSource.getTasks();
      return Success(
        response.map((e) => e.toEntity()).toList(),
      );
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> assignTask(TasksEntity task) async {
    try {
      await remoteDataSource.assignTask(task.toModel());
      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> updateTask(TasksEntity task) async {
    try {
      await remoteDataSource.updateTask(task.toModel());
      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> deleteTask(String taskId) async {
    try {
      await remoteDataSource.deleteTask(taskId);
      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}