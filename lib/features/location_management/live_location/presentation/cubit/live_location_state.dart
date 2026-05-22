import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LiveLocationState extends Equatable {
  const LiveLocationState();

  @override
  List<Object?> get props => [];
}

class LiveLocationInitialState extends LiveLocationState {}

class LiveLocationLoading extends LiveLocationState {}

class LiveLocationSuccessState extends LiveLocationState {
  final List<LiveLocationEntity> locations;

  const LiveLocationSuccessState(this.locations);
  @override
  List<Object?> get props => [locations];
}

class LiveLocationErrorState extends LiveLocationState {
  final String message;

  const LiveLocationErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
