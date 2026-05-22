import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLogInRemoteDataSource {
  Future<void> getLogIn({required String email, required String password});
}

@LazySingleton(as: BaseLogInRemoteDataSource)
class LogInRemoteDataSource implements BaseLogInRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  LogInRemoteDataSource(this._supabase, this._userService);

  @override
  Future<void>  getLogIn({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(password: password, email: email);
    
        } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
