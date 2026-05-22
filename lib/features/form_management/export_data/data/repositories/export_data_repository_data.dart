import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/common/models/form_model/form_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/export_data/data/datasources/export_data_remote_data_source.dart';
import 'package:mobeen/features/form_management/export_data/domain/repositories/export_data_repository_domain.dart';

@LazySingleton(as: ExportDataRepositoryDomain)
class ExportDataRepositoryData implements ExportDataRepositoryDomain {
  final BaseExportDataRemoteDataSource remoteDataSource;

  ExportDataRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<FormEntity>, Failure>> getExportData() async {
    try {
      final response = await remoteDataSource.getExportData();
      return Success(response.map((u) => u.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> exportSelectedForms({
    required List<String> forms,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      await remoteDataSource.exportSelectedForms(
        forms: forms,
        fromDate: fromDate,
        toDate: toDate,
      );
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
