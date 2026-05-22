import 'package:mobeen/features/form_management/fill_form/domain/entities/fill_form_entity.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/generate_form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/fill_form/domain/repositories/fill_form_repository_domain.dart';

@lazySingleton
class FillFormUseCase {
  final FillFormRepositoryDomain _repositoryData;

  FillFormUseCase(this._repositoryData);

  Future<Result<GenerateFormEntity, Failure>> getForm({
    required String formId,
  }) async {
    return _repositoryData.getForm(formId: formId);
  }

  Future<Result<void, Failure>> submit({required  List<FillFormEntity> submitAnswers}) async {
    return _repositoryData.submit(submitAnswers: submitAnswers);
  }
}
