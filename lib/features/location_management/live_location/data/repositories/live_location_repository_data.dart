import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:mobeen/features/location_management/live_location/data/datasources/live_location_remote_data_source.dart';
import 'package:mobeen/features/location_management/live_location/data/models/live_location_model.dart';
import 'package:mobeen/features/location_management/live_location/domain/repositories/live_location_repository_domain.dart';

@LazySingleton(as: LiveLocationRepositoryDomain)
class LiveLocationRepositoryData implements LiveLocationRepositoryDomain {
  final BaseLiveLocationRemoteDataSource remoteDataSource;
  LiveLocationRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> updateLiveLocation(
    LiveLocationEntity entity,
  ) async {
    try {
      await remoteDataSource.updateLiveLocation(entity.toModel());
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Stream<List<LiveLocationEntity>> streamLiveLocations() {
    return remoteDataSource.streamLiveLocations().map(
      (models) => models.map((e) => e.toEntity()).toList(),
    );
  }
}
