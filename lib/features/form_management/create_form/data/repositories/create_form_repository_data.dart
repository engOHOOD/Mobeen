import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';

import 'package:mobeen/features/form_management/create_form/data/datasources/create_form_remote_data_source.dart';
import 'package:mobeen/features/form_management/create_form/domain/repositories/create_form_repository_domain.dart';

@LazySingleton(as: CreateFormRepositoryDomain)
class CreateFormRepositoryData implements CreateFormRepositoryDomain {
  final BaseCreateFormRemoteDataSource remoteDataSource;

  CreateFormRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> createForm({
    required String title,
    required String description,
    required int target,
    required List<AddQuestion> questions,
  }) async {
    try {
      await remoteDataSource.createForm(
        title: title,
        description: description,
        target:target,
        questions: questions,

      );
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
