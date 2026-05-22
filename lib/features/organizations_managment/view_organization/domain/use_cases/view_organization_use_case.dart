import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/entities/view_organization_entity.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/repositories/view_organization_repository_domain.dart';


@lazySingleton
class ViewOrganizationUseCase {
  final ViewOrganizationRepositoryDomain _repositoryData;

  ViewOrganizationUseCase(this._repositoryData);

  Future<Result<List<ViewOrganizationEntity>, Failure>> getViewOrganization() async {
    return _repositoryData.getViewOrganization();
  }
}
