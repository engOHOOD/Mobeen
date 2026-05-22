
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/auth/set_password/data/datasources/set_password_remote_data_source.dart';
import 'package:mobeen/features/auth/set_password/domain/repositories/set_password_repository_domain.dart';

@LazySingleton(as: SetPasswordRepositoryDomain)
class SetPasswordRepositoryData implements SetPasswordRepositoryDomain{
  final BaseSetPasswordRemoteDataSource remoteDataSource;


  SetPasswordRepositoryData(this.remoteDataSource);

@override
  Future<Result<void, Failure>> getSetPassword({required String password}) async {
    try {
      final response = await remoteDataSource.getSetPassword(password: password);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
