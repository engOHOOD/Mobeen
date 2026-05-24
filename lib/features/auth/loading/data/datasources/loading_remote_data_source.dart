import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/auth/loading/data/models/loading_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<LoadingModel> getLoading();
}

@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalKeysService _localKeysService;

  LoadingRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._userService,
  );

  @override
  Future<LoadingModel> getLoading() async {
    try {
      final userToken = _supabase.auth.currentSession?.accessToken;
      final isLogin = userToken != null;
      final isExpired = _supabase.auth.currentSession?.isExpired ?? true;

      if (isLogin && !isExpired) {
        final userData = await _supabase
            .from('users')
            .select()
            .eq('auth_id', _supabase.auth.currentUser!.id)
            .single();
        final userModel = UserModel.fromJson(userData);
        _userService.setUser = userModel;
        return LoadingModel(isLogin: true);
      }

      return LoadingModel(isLogin: false);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
