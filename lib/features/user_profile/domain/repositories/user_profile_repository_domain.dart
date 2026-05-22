import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class UserProfileRepositoryDomain {
    Future<Result<UserEntity, Failure>> getUserProfile();
}
