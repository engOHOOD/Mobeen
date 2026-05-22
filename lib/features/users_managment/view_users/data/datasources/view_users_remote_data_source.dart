import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseViewUsersRemoteDataSource {
  Future<List<UserModel>> getViewUsers();
}

@LazySingleton(as: BaseViewUsersRemoteDataSource)
class ViewUsersRemoteDataSource implements BaseViewUsersRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ViewUsersRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<UserModel>> getViewUsers() async {
    try {
      print("wertyui");
      final response = await _supabase
          .from("users")
          .select()
          .neq('role', 'super_admin');
      print("vgbnm");

      final users = response.map((u) => UserModel.fromJson(u)).toList();
      print("5678");

      return users;
    } catch (error) {
            print("$error");

      throw FailureExceptions.getException(error);
    }
  }
}
