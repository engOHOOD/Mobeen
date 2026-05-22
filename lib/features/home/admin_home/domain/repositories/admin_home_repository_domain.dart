import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/home/admin_home/domain/entities/admin_home_entity.dart';

abstract class AdminHomeRepositoryDomain {
    Future<Result<AdminHomeEntity, Failure>> getAdminHome();
}
