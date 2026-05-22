import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';

abstract class LiveLocationRepositoryDomain {
  Future<Result<void, Failure>> updateLiveLocation(LiveLocationEntity entity);
  Stream<List<LiveLocationEntity>> streamLiveLocations();
}
