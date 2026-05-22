import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:multiple_result/multiple_result.dart';
abstract class LogInRepositoryDomain {
    Future<Result<void, Failure>> getLogIn({
    required String email,
    required String password,});
}
