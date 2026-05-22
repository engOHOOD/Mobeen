import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/assign_form/domain/repositories/assign_form_repository_domain.dart';

@lazySingleton
class AssignFormUseCase {
  final AssignFormRepositoryDomain _repositoryData;

  AssignFormUseCase(this._repositoryData);

  Future<Result<List<UserEntity>, Failure>> getAssignForm({
    required String formId,
  }) async {
    return _repositoryData.getAssignForm(formId: formId);
  }

  Future<Result<void, Failure>> assignForm({
    required String userId,
    required String formId,
    required String target,
  }) async {
    return _repositoryData.assignForm(
      userId: userId,
      formId: formId,
      target: target,
    );
  }
}
