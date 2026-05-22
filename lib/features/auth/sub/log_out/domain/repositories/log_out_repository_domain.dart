import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class LogOutRepositoryDomain {
  Future<Result<void, Failure>> getLogOut();
}
