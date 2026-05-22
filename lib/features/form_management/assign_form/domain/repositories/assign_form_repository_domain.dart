import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class AssignFormRepositoryDomain {
  Future<Result<List<UserEntity>, Failure>> getAssignForm({
    required String formId,
  });
  Future<Result<void, Failure>> assignForm({
    required String userId,
    required String formId,
    required String target,
  });
}
