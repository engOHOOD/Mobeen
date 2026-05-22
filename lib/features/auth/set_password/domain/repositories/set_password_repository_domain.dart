import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class SetPasswordRepositoryDomain {
    Future<Result<void, Failure>> getSetPassword({required String password});
}
