import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/export_data/domain/repositories/export_data_repository_domain.dart';

@lazySingleton
class ExportDataUseCase {
  final ExportDataRepositoryDomain _repositoryData;

  ExportDataUseCase(this._repositoryData);

  Future<Result<List<FormEntity>, Failure>> getExportData() async {
    return _repositoryData.getExportData();
  }

  Future<Result<void, Failure>> exportSelectedForms({
    required List<String> forms,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    return _repositoryData.exportSelectedForms(
      forms: forms,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
