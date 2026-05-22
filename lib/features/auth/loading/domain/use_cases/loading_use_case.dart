import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/auth/loading/domain/entities/loading_entity.dart';
import 'package:mobeen/features/auth/loading/domain/repositories/loading_repository_domain.dart';


@lazySingleton
class LoadingUseCase {
  final LoadingRepositoryDomain _repositoryData;

  LoadingUseCase(this._repositoryData);

   Future<Result<LoadingEntity, Failure>> getLoading() async {
    return _repositoryData.getLoading();
  }
}
