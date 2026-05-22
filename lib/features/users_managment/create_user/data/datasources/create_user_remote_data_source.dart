import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseCreateUserRemoteDataSource {
  Future<void> getCreateUser({
    required String name,
    required String email,
    required String phone,
    required String role,
  });
}

@LazySingleton(as: BaseCreateUserRemoteDataSource)
class CreateUserRemoteDataSource implements BaseCreateUserRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  CreateUserRemoteDataSource(this._userService, this._supabase);

  Future<void> getCreateUser({
    required String name,
    required String email,
    required String phone,
    required String role,
  }) async {
    try {
      final organisation = _userService.getUser!.organisationsId;
      await _supabase.functions.invoke(
        'invite-user',
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'role': role,
          'organisations_id': organisation,
        },
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
