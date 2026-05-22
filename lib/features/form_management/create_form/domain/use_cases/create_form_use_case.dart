import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/create_form/domain/repositories/create_form_repository_domain.dart';

@lazySingleton
class CreateFormUseCase {
  final CreateFormRepositoryDomain _repositoryData;

  CreateFormUseCase(this._repositoryData);

  Future<Result<void, Failure>> createForm({
    required String title,
    required String description,
    required int target,
    required List<AddQuestion> questions,
  }) async {
    return _repositoryData.createForm(
      title: title,
      description: description,
      questions: questions,
      target: target,
    );
  }
}
