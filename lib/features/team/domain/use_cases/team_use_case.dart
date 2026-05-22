import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/team/domain/repositories/team_repository_domain.dart';


@lazySingleton
class TeamUseCase {
  final TeamRepositoryDomain _repositoryData;

  TeamUseCase(this._repositoryData);

   Future<Result<List<UserEntity>, Failure>> getTeam() async {
    return _repositoryData.getTeam();
  }
   Future<Result<List<UserEntity>, Failure>> getAvailableResearchers() async {
    return _repositoryData.getAvailableResearchers();
  }
    Future<Result<void, Failure>> addResearcherToTeam({required String researcherId}) async {
    return _repositoryData.addResearcherToTeam( researcherId: researcherId);
  }
   Future<Result<void, Failure>> removeResearcherFromTeam({required String researcherId}) async {
    return _repositoryData.removeResearcherFromTeam( researcherId: researcherId);
  }
}
