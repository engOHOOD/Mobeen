import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/users_managment/view_users/data/datasources/view_users_remote_data_source.dart';
import 'package:mobeen/features/users_managment/view_users/domain/repositories/view_users_repository_domain.dart';

@LazySingleton(as: ViewUsersRepositoryDomain)
class ViewUsersRepositoryData implements ViewUsersRepositoryDomain {
  final BaseViewUsersRemoteDataSource remoteDataSource;

  ViewUsersRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<UserEntity>, Failure>> getViewUsers() async {
    try {
      final response = await remoteDataSource.getViewUsers();
      return Success(response.map((u) => u.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
