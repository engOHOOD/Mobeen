
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/home/admin_home/domain/entities/admin_home_entity.dart';

import 'package:mobeen/features/home/admin_home/data/datasources/admin_home_remote_data_source.dart';
import 'package:mobeen/features/home/admin_home/data/models/admin_home_model.dart';
import 'package:mobeen/features/home/admin_home/domain/repositories/admin_home_repository_domain.dart';

@LazySingleton(as: AdminHomeRepositoryDomain)
class AdminHomeRepositoryData implements AdminHomeRepositoryDomain{
  final BaseAdminHomeRemoteDataSource remoteDataSource;


  AdminHomeRepositoryData(this.remoteDataSource);

@override
  Future<Result<AdminHomeEntity, Failure>> getAdminHome() async {
    try {
      final response = await remoteDataSource.getAdminHome();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
