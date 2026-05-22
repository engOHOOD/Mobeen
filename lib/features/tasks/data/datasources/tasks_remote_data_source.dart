import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/features/tasks/data/models/tasks_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseTasksRemoteDataSource {
  Future<List<TasksModel>> getTasks();
  Future<void> assignTask(TasksModel model);
  Future<void> updateTask(TasksModel model);
  Future<void> deleteTask(String taskId);
}

@LazySingleton(as: BaseTasksRemoteDataSource)
class TasksRemoteDataSource implements BaseTasksRemoteDataSource {
  final SupabaseClient _supabase;
  TasksRemoteDataSource(this._supabase);

  @override
  Future<List<TasksModel>> getTasks() async {
    try {
      final response = await _supabase.from('task_assignments').select();
      return (response as List)
          .map((json) => TasksModel.fromJson(json))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // 🟢 ASSIGN TASK
  @override
  Future<void> assignTask(TasksModel model) async {
    try {
      print('TTTTESTTTING Task');
      print(model);
      final response = await _supabase.from('task_assignments').insert(model.toJson()) .select();
      print('INSERT RESULT: $response');
    } catch (error, stack) {
      print('SUPABASE ERROR: $error');
      print('STACK: $stack');
      throw FailureExceptions.getException(error);
    }
  }

  // 🟠 UPDATE TASK
  @override
  Future<void> updateTask(TasksModel model) async {
    try {
      if (model.id == null) {
        throw Exception("Task ID is required for update");
      }
      await _supabase
          .from('task_assignments')
          .update(model.toJson())
          .eq('id', model.id!);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // 🔴 DELETE TASK (soft delete recommended)
  @override
  Future<void> deleteTask(String taskId) async {
    try {
      await _supabase
          .from('task_assignments')
          .update({'status': 'disabled'})
          .eq('id', taskId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
