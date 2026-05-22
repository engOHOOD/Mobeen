import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/features/home/admin_home/data/models/admin_home_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseAdminHomeRemoteDataSource {
  Future<AdminHomeModel> getAdminHome();
}

@LazySingleton(as: BaseAdminHomeRemoteDataSource)
class AdminHomeRemoteDataSource implements BaseAdminHomeRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  AdminHomeRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<AdminHomeModel> getAdminHome() async {
    try {
      final count = await _supabase.from('companies').count();

      print(count);
      return AdminHomeModel(
        id: 1,
        firstName: "Last Name",
        lastName: "First Name",
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
