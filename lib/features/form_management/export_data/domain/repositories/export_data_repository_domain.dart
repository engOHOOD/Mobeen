import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class ExportDataRepositoryDomain {
  Future<Result<List<FormEntity>, Failure>> getExportData();
  Future<Result<void, Failure>> exportSelectedForms({
    required List<String> forms,
    required DateTime fromDate,
    required DateTime toDate,
  });
}
