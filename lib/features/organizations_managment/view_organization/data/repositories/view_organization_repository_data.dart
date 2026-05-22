
import 'package:injectable/injectable.dart';
import 'package:mobeen/features/organizations_managment/view_organization/data/models/view_organization_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/entities/view_organization_entity.dart';

import 'package:mobeen/features/organizations_managment/view_organization/data/datasources/view_organization_remote_data_source.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/repositories/view_organization_repository_domain.dart';

@LazySingleton(as: ViewOrganizationRepositoryDomain)
class ViewOrganizationRepositoryData implements ViewOrganizationRepositoryDomain{
  final BaseViewOrganizationRemoteDataSource remoteDataSource;


  ViewOrganizationRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<ViewOrganizationEntity>, Failure>> getViewOrganization() async {
    try {
      final response = await remoteDataSource.getViewOrganization();
      return Success(response.map((o) => o.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
