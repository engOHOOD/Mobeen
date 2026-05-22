import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/entities/view_organization_entity.dart';

abstract class ViewOrganizationRepositoryDomain {
  Future<Result<List<ViewOrganizationEntity>, Failure>> getViewOrganization();
}
