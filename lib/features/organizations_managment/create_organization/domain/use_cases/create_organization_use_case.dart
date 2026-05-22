import 'dart:typed_data';

import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/organizations_managment/create_organization/domain/repositories/create_organization_repository_domain.dart';

@lazySingleton
class CreateOrganizationUseCase {
  final CreateOrganizationRepositoryDomain _repositoryData;

  CreateOrganizationUseCase(this._repositoryData);

  Future<Result<void, Failure>> getCreateOrganization({
    required String email,
    required String organizationName,
    required String nationalAddress,
    required Uint8List? organizationLogoBytes,
    required String name,
    required String adminemail,
    required String phone,
  }) async {
    return _repositoryData.getCreateOrganization(
     email: email,
      organizationName: organizationName,
      nationalAddress: nationalAddress,
      organizationLogoBytes: organizationLogoBytes,
      name: name,
      adminemail: adminemail,
      phone: phone,
    );
  }
}
