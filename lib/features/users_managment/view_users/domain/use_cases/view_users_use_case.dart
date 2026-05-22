import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/users_managment/view_users/domain/repositories/view_users_repository_domain.dart';

@lazySingleton
class ViewUsersUseCase {
  final ViewUsersRepositoryDomain _repositoryData;

  ViewUsersUseCase(this._repositoryData);

  Future<Result<List<UserEntity>, Failure>> getViewUsers() async {
    return _repositoryData.getViewUsers();
  }
}
