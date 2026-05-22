import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:mobeen/features/location_management/live_location/domain/repositories/live_location_repository_domain.dart';


@lazySingleton
class LiveLocationUseCase {
  
  final LiveLocationRepositoryDomain _repositoryData;
  LiveLocationUseCase(this._repositoryData);

  Future<Result<void, Failure>> updateLiveLocation( LiveLocationEntity entity) async {
    return await _repositoryData.updateLiveLocation(entity);
  }
  Stream<List<LiveLocationEntity>> streamLiveLocations() {
    return _repositoryData.streamLiveLocations();
  }
}
