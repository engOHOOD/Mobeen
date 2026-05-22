import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/user_profile/domain/repositories/user_profile_repository_domain.dart';


@lazySingleton
class UserProfileUseCase {
  final UserProfileRepositoryDomain _repositoryData;

  UserProfileUseCase(this._repositoryData);

   Future<Result<UserEntity, Failure>> getUserProfile() async {
    return _repositoryData.getUserProfile();
  }
}
