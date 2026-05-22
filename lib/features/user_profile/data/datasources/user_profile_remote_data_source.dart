import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseUserProfileRemoteDataSource {
  Future<UserModel> getUserProfile();
}

@LazySingleton(as: BaseUserProfileRemoteDataSource)
class UserProfileRemoteDataSource implements BaseUserProfileRemoteDataSource {
  final SupabaseClient _supabase;
  UserProfileRemoteDataSource(this._supabase);

  @override
  Future<UserModel> getUserProfile() async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception("No logged-in user found");
      }

      final response = await _supabase
          .from('user_profile_view')
          .select()
          .eq('id', userId)
          .single();

      return UserModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
