import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/features/home/user_home/data/models/user_home_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';


abstract class BaseUserHomeRemoteDataSource {
  Future<UserHomeModel> getUserHome();
}


@LazySingleton(as: BaseUserHomeRemoteDataSource)
class UserHomeRemoteDataSource implements BaseUserHomeRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   UserHomeRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<UserHomeModel> getUserHome() async {
    try {
      return UserHomeModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
