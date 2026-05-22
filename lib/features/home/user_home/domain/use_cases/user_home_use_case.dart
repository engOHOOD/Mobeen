import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/home/user_home/domain/entities/user_home_entity.dart';
import 'package:mobeen/features/home/user_home/domain/repositories/user_home_repository_domain.dart';


@lazySingleton
class UserHomeUseCase {
  final UserHomeRepositoryDomain _repositoryData;

  UserHomeUseCase(this._repositoryData);

   Future<Result<UserHomeEntity, Failure>> getUserHome() async {
    return _repositoryData.getUserHome();
  }
}
