import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseTeamRemoteDataSource {
  Future<List<UserModel>> getTeam();
  Future<List<UserModel>> getAvailableResearchers();
  Future<void> addResearcherToTeam({required String researcherId});
  Future<void> removeResearcherFromTeam({required String researcherId});
}

@LazySingleton(as: BaseTeamRemoteDataSource)
class TeamRemoteDataSource implements BaseTeamRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  TeamRemoteDataSource(this._supabase, this._userService);

  @override
  Future<List<UserModel>> getTeam() async {
    try {
      final supervisorId = _userService.getUser?.id;
      if (supervisorId == null) {
        throw Exception("No supervisor logged in");
      }

      final response = await _supabase
          .from('users')
          .select()
          .eq('supervisor_id', supervisorId!);

      return (response as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<List<UserModel>> getAvailableResearchers() async {
    try {
      final response = await _supabase
          .from('users')
          .select()
          .eq('role', 'researcher')
          .isFilter('supervisor_id', null);
      print('------$response');
      return (response as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> addResearcherToTeam({required String researcherId}) async {
    try {
      final supervisorId = _userService.getUser?.id;

      await _supabase
          .from('users')
          .update({'supervisor_id': supervisorId})
          .eq('id', researcherId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> removeResearcherFromTeam({required String researcherId}) async {
    try {
      await _supabase
          .from('users')
          .update({'supervisor_id': null})
          .eq('id', researcherId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
