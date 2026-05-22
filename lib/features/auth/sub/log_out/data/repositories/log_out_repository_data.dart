import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';

import 'package:mobeen/features/auth/sub/log_out/data/datasources/log_out_remote_data_source.dart';
import 'package:mobeen/features/auth/sub/log_out/domain/repositories/log_out_repository_domain.dart';

@LazySingleton(as: LogOutRepositoryDomain)
class LogOutRepositoryData implements LogOutRepositoryDomain {
  final BaseLogOutRemoteDataSource remoteDataSource;

  LogOutRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getLogOut() async {
    try {
      await remoteDataSource.getLogOut();
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
