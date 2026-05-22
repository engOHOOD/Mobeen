import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/user_profile/data/datasources/user_profile_remote_data_source.dart';
import 'package:mobeen/features/user_profile/domain/repositories/user_profile_repository_domain.dart';

@LazySingleton(as: UserProfileRepositoryDomain)
class UserProfileRepositoryData implements UserProfileRepositoryDomain{
  final BaseUserProfileRemoteDataSource remoteDataSource;


  UserProfileRepositoryData(this.remoteDataSource);

@override
  Future<Result<UserEntity, Failure>> getUserProfile() async {
    try {
      final response = await remoteDataSource.getUserProfile();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
