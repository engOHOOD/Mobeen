import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/assign_form/data/datasources/assign_form_remote_data_source.dart';
import 'package:mobeen/features/form_management/assign_form/domain/repositories/assign_form_repository_domain.dart';

@LazySingleton(as: AssignFormRepositoryDomain)
class AssignFormRepositoryData implements AssignFormRepositoryDomain {
  final BaseAssignFormRemoteDataSource remoteDataSource;

  AssignFormRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<UserEntity>, Failure>> getAssignForm({
    required String formId,
  }) async {
    try {
      final response = await remoteDataSource.getAssignForm(formId: formId);
      return Success(response.map((u) => u.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> assignForm({
    required String userId,
    required String formId,
    required String target,
  }) async {
    try {
      await remoteDataSource.assignForm(
        userId: userId,
        formId: formId,
        target: target,
      );
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
