import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';
import 'package:mobeen/features/location_management/location/domain/repositories/location_repository_domain.dart';


@lazySingleton
class LocationUseCase {
  final LocationRepositoryDomain _repositoryData;

  LocationUseCase(this._repositoryData);

    Future<Result<void, Failure>> addLocation(LocationEntity location) async{
    return _repositoryData.addLocation(location);
    }
    Future<Result<List<LocationEntity>, Failure>> getLocations() async{
    return _repositoryData.getLocations();
    }
}
