import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseLogOutRemoteDataSource {
  Future<void> getLogOut();
}

@LazySingleton(as: BaseLogOutRemoteDataSource)
class LogOutRemoteDataSource implements BaseLogOutRemoteDataSource {
  final SupabaseClient _supabase;

  LogOutRemoteDataSource(this._supabase);

  @override
  Future<void> getLogOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
