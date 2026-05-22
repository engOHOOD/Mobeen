import 'dart:typed_data';

import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class CreateOrganizationRepositoryDomain {
  Future<Result<void, Failure>> getCreateOrganization({
    required String email,
    required String organizationName,
    required String nationalAddress,
    required Uint8List? organizationLogoBytes,
    required String name,
    required String adminemail,
    required String phone,
  });
}
