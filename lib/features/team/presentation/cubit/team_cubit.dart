import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/features/team/domain/use_cases/team_use_case.dart';
import 'package:mobeen/features/team/presentation/cubit/team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamUseCase _teamUseCase;

  TeamCubit(this._teamUseCase) : super(TeamInitialState()) {
    getTeam();
    getAvailableResearchers();
  }

  List<UserEntity> team = [];
  List<UserEntity> availableResearchers = [];

  Future<void> getTeam() async {
    final result = await _teamUseCase.getTeam();
    result.when(
      (success) {
        team = success;
        emit(GetTeamSuccessState(success));
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getAvailableResearchers() async {
    final result = await _teamUseCase.getAvailableResearchers();
    result.when(
      (success) {
        availableResearchers = success;
        emit(GetAvailableResearchersSuccessState(success));
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  Future<void> addResearcher(String researcherId) async {
    emit(TeamLoadingState());

    final result = await _teamUseCase.addResearcherToTeam(
      researcherId: researcherId,
    );
    result.when(
      (success) {
        getTeam();
        getAvailableResearchers();
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  Future<void> removeResearcher(String researcherId) async {
    emit(TeamLoadingState());

    final result = await _teamUseCase.removeResearcherFromTeam(
      researcherId: researcherId,
    );
    result.when(
      (success) {
        getTeam();
        getAvailableResearchers();
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
