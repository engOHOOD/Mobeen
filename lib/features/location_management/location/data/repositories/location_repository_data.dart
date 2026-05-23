import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';

import 'package:mobeen/features/location_management/location/data/datasources/location_remote_data_source.dart';
import 'package:mobeen/features/location_management/location/data/models/location_model.dart';
import 'package:mobeen/features/location_management/location/domain/repositories/location_repository_domain.dart';

@LazySingleton(as: LocationRepositoryDomain)
class LocationRepositoryData implements LocationRepositoryDomain {
  final BaseLocationRemoteDataSource remoteDataSource;

  LocationRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> addLocation(LocationEntity location) async {
    try {
      await remoteDataSource.addLocation(
        LocationModel(
          name: location.name,
          nationalAddress: location.nationalAddress,
          latitude: location.latitude,
          longitude: location.longitude,
          status: location.status,
        ),
      );
      
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<List<LocationEntity>, Failure>> getLocations() async {
    try {
      final response = await remoteDataSource.getLocations();
      final entities = response.map((model) => model.toEntity()).toList();
      return Success(entities);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
