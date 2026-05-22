import 'package:equatable/equatable.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}
class LocationInitialState extends LocationState {}
class LocationLoadingState extends LocationState {}
class AddLocationSuccessState extends LocationState {}
class GetLocationsSuccessState  extends LocationState {
  final List<LocationEntity> locations;

  const GetLocationsSuccessState (this.locations);

  @override
  List<Object?> get props => [locations];
}

class LocationErrorState extends LocationState {
  final String message;
  const LocationErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

