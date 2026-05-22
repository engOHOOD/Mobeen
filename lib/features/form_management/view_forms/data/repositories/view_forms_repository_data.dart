
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/common/models/form_model/form_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';

import 'package:mobeen/features/form_management/view_forms/data/datasources/view_forms_remote_data_source.dart';
import 'package:mobeen/features/form_management/view_forms/domain/repositories/view_forms_repository_domain.dart';

@LazySingleton(as: ViewFormsRepositoryDomain)
class ViewFormsRepositoryData implements ViewFormsRepositoryDomain{
  final BaseViewFormsRemoteDataSource remoteDataSource;


  ViewFormsRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<FormEntity>, Failure>> getViewForms() async {
    try {
      final response = await remoteDataSource.getViewForms();
      return Success(response.map((u) => u.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
