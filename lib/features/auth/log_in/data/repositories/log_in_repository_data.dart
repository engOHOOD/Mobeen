import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/features/auth/log_in/data/datasources/log_in_remote_data_source.dart';
import 'package:mobeen/features/auth/log_in/domain/repositories/log_in_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: LogInRepositoryDomain)
class LogInRepositoryData implements LogInRepositoryDomain {
  final BaseLogInRemoteDataSource remoteDataSource;

  LogInRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getLogIn({
    required String email,
    required String password,
  }) async {
    try {
       await remoteDataSource.getLogIn(
        email: email,
        password: password,
      );
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
