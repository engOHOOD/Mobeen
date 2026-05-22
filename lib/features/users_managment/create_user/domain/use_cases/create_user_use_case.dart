import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/users_managment/create_user/domain/repositories/create_user_repository_domain.dart';


@lazySingleton
class CreateUserUseCase {
  final CreateUserRepositoryDomain _repositoryData;

  CreateUserUseCase(this._repositoryData);

   Future<Result<void, Failure>> getCreateUser({
    required String name,
    required String email,
    required String phone,
    required String role,
  }) async {
    return _repositoryData.getCreateUser(  name: name,
      email: email,
      phone: phone,
      role: role,);
  }
}
