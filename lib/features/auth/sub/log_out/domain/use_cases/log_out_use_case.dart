import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/auth/sub/log_out/domain/repositories/log_out_repository_domain.dart';

@lazySingleton
class LogOutUseCase {
  final LogOutRepositoryDomain _repositoryData;

  LogOutUseCase(this._repositoryData);

  Future<Result<void, Failure>> getLogOut() async {
    return _repositoryData.getLogOut();
  }
}
