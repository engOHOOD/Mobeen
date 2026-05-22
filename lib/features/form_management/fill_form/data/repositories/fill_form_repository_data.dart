import 'package:injectable/injectable.dart';
import 'package:mobeen/features/form_management/fill_form/data/models/generate_form_model/generate_form_model.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/fill_form_entity.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/generate_form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';

import 'package:mobeen/features/form_management/fill_form/data/datasources/fill_form_remote_data_source.dart';
import 'package:mobeen/features/form_management/fill_form/domain/repositories/fill_form_repository_domain.dart';

@LazySingleton(as: FillFormRepositoryDomain)
class FillFormRepositoryData implements FillFormRepositoryDomain {
  final BaseFillFormRemoteDataSource remoteDataSource;

  FillFormRepositoryData(this.remoteDataSource);

  @override
  Future<Result<GenerateFormEntity, Failure>> getForm({
    required String formId,
  }) async {
    try {
      final response = await remoteDataSource.getForm(formId: formId);
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> submit({
    required List<FillFormEntity> submitAnswers,
  }) async {
    try {
      await remoteDataSource.submit(submitAnswers: submitAnswers);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
