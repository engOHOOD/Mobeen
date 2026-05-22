import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/question_entity.dart';
import 'package:mobeen/core/common/models/question_model/question_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';

import 'package:mobeen/features/form_management/view_form/data/datasources/view_form_remote_data_source.dart';
import 'package:mobeen/features/form_management/view_form/domain/repositories/view_form_repository_domain.dart';

@LazySingleton(as: ViewFormRepositoryDomain)
class ViewFormRepositoryData implements ViewFormRepositoryDomain {
  final BaseViewFormRemoteDataSource remoteDataSource;

  ViewFormRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<QuestionEntity>, Failure>> getViewForm({required String formId}) async {
    try {
      final response = await remoteDataSource.getViewForm(formId: formId);
      return Success(response.map((u) => u.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
