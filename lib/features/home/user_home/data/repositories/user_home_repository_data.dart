
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/home/user_home/domain/entities/user_home_entity.dart';

import 'package:mobeen/features/home/user_home/data/datasources/user_home_remote_data_source.dart';
import 'package:mobeen/features/home/user_home/data/models/user_home_model.dart';
import 'package:mobeen/features/home/user_home/domain/repositories/user_home_repository_domain.dart';

@LazySingleton(as: UserHomeRepositoryDomain)
class UserHomeRepositoryData implements UserHomeRepositoryDomain{
  final BaseUserHomeRemoteDataSource remoteDataSource;


  UserHomeRepositoryData(this.remoteDataSource);

@override
  Future<Result<UserHomeEntity, Failure>> getUserHome() async {
    try {
      final response = await remoteDataSource.getUserHome();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
