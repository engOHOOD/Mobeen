import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseSetPasswordRemoteDataSource {
  Future<void> getSetPassword({required String password});
}

@LazySingleton(as: BaseSetPasswordRemoteDataSource)
class SetPasswordRemoteDataSource implements BaseSetPasswordRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  SetPasswordRemoteDataSource(this._userService, this._supabase);

  @override
  Future<void> getSetPassword({required String password}) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(password: password));
      final userData = await _supabase
          .from('users')
          .update({'must_reset_password': false})
          .eq('id', _supabase.auth.currentUser!.id);
      _userService.setUser = UserModel.fromJson(userData);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
