import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/home/admin_home/domain/entities/admin_home_entity.dart';
import 'package:mobeen/features/home/admin_home/domain/repositories/admin_home_repository_domain.dart';


@lazySingleton
class AdminHomeUseCase {
  final AdminHomeRepositoryDomain _repositoryData;

  AdminHomeUseCase(this._repositoryData);

   Future<Result<AdminHomeEntity, Failure>> getAdminHome() async {
    return _repositoryData.getAdminHome();
  }
}
