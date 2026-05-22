import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:uuid/uuid.dart';

abstract class BaseAssignFormRemoteDataSource {
  Future<List<UserModel>> getAssignForm({required String formId});
  Future<void> assignForm({
    required String userId,
    required String formId,
    required String target,
  });
}

@LazySingleton(as: BaseAssignFormRemoteDataSource)
class AssignFormRemoteDataSource implements BaseAssignFormRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  AssignFormRemoteDataSource(this._supabase, this._userService);

  @override
  Future<List<UserModel>> getAssignForm({required String formId}) async {
    try {
      // 1. Get assigned users
      final assignedResponse = await _supabase
          .from('user_forms')
          .select('user_id')
          .eq('form_id', formId);

      final assignedIds = assignedResponse.map((e) => e['user_id']).toList();

      // 2. Get researchers under supervisor
      final response = await _supabase
          .from("users")
          .select()
          .eq('role', 'researcher')
          .eq('supervisor_id', _userService.getUser!.id);

      // 3. Filter locally
      final filtered = response
          .where((u) => !assignedIds.contains(u['id']))
          .toList();

      final user = filtered.map((u) => UserModel.fromJson(u)).toList();

      return user;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> assignForm({
    required String userId,
    required String formId,
    required String target,
  }) async {
    try {
      await _supabase
          .from("user_forms")
          .insert({
            'id': Uuid().v4(),
            "user_id": userId,
            'form_id': formId,
            'target': target,
          })
          .select()
          .maybeSingle();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
