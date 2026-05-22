import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object?> get props => [];
}

class TeamInitialState extends TeamState {}
class TeamLoadingState extends TeamState {}
class GetTeamSuccessState extends TeamState {
  final List<UserEntity> team;

  const GetTeamSuccessState(this.team);

  @override
  List<Object?> get props => [team];
}

class GetAvailableResearchersSuccessState extends TeamState {
  final List<UserEntity> researchers;

  const GetAvailableResearchersSuccessState(this.researchers);

  @override
  List<Object?> get props => [researchers];
}

class TeamErrorState extends TeamState {
  final String message;
  const TeamErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

