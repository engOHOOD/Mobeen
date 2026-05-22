import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class CreateUserRepositoryDomain {
    Future<Result<void, Failure>> getCreateUser({
    required String name,
    required String email,
    required String phone,
    required String role,
  });
}
