import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/view_forms/domain/repositories/view_forms_repository_domain.dart';


@lazySingleton
class ViewFormsUseCase {
  final ViewFormsRepositoryDomain _repositoryData;

  ViewFormsUseCase(this._repositoryData);

  Future<Result<List<FormEntity>, Failure>> getViewForms() async {
    return _repositoryData.getViewForms();
  }
}
