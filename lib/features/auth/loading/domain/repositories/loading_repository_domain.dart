import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/auth/loading/domain/entities/loading_entity.dart';

abstract class LoadingRepositoryDomain {
    Future<Result<LoadingEntity, Failure>> getLoading();
}
