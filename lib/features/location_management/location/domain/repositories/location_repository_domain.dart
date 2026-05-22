import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';

abstract class LocationRepositoryDomain {
    Future<Result<void, Failure>> addLocation(LocationEntity location);
    Future<Result<List<LocationEntity>, Failure>> getLocations();
}
