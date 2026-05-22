import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';

import 'package:mobeen/features/organizations_managment/create_organization/data/datasources/create_organization_remote_data_source.dart';
import 'package:mobeen/features/organizations_managment/create_organization/domain/repositories/create_organization_repository_domain.dart';

@LazySingleton(as: CreateOrganizationRepositoryDomain)
class CreateOrganizationRepositoryData
    implements CreateOrganizationRepositoryDomain {
  final BaseCreateOrganizationRemoteDataSource remoteDataSource;

  CreateOrganizationRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getCreateOrganization({
    required String email,
    required String organizationName,
    required String nationalAddress,
    required Uint8List? organizationLogoBytes,
    required String name,
    required String adminemail,
    required String phone,
  }) async {
    try {
      await remoteDataSource.getCreateOrganization(
        email: email,
        organizationName: organizationName,
        nationalAddress: nationalAddress,
        organizationLogoBytes: organizationLogoBytes,
        name: name,
        adminemail: adminemail,
        phone: phone,
      );
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
