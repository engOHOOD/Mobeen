import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/home/user_home/domain/entities/user_home_entity.dart';

abstract class UserHomeRepositoryDomain {
    Future<Result<UserHomeEntity, Failure>> getUserHome();
}
