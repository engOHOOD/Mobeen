
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/users_managment/create_user/data/datasources/create_user_remote_data_source.dart';
import 'package:mobeen/features/users_managment/create_user/domain/repositories/create_user_repository_domain.dart';

@LazySingleton(as: CreateUserRepositoryDomain)
class CreateUserRepositoryData implements CreateUserRepositoryDomain{
  final BaseCreateUserRemoteDataSource remoteDataSource;


  CreateUserRepositoryData(this.remoteDataSource);

@override
  Future<Result<void, Failure>> getCreateUser({
    required String name,
    required String email,
    required String phone,
    required String role,
  }) async {
    try {
      await remoteDataSource.getCreateUser(  name: name,
      email: email,
      phone: phone,
      role: role,);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
