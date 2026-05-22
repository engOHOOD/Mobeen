import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/auth/set_password/domain/repositories/set_password_repository_domain.dart';


@lazySingleton
class SetPasswordUseCase {
  final SetPasswordRepositoryDomain _repositoryData;

  SetPasswordUseCase(this._repositoryData);

   Future<Result<void, Failure>> getSetPassword({required String password}) async {
    return _repositoryData.getSetPassword(password:password);
  }
}
