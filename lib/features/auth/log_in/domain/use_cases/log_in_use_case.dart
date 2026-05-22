import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/auth/log_in/domain/repositories/log_in_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogInUseCase {
  final LogInRepositoryDomain _repositoryData;

  LogInUseCase(this._repositoryData);

   Future<Result<void, Failure>> getLogIn({
    required String email,
    required String password,}) async {
    return _repositoryData.getLogIn(email: email,password: password);
  }
}
