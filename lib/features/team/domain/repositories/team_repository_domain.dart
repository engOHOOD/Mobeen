import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class TeamRepositoryDomain {
  Future<Result<List<UserEntity>, Failure>> getTeam();
  Future<Result<List<UserEntity>, Failure>> getAvailableResearchers();
  Future<Result<void, Failure>> addResearcherToTeam({ required String researcherId });
  Future<Result<void, Failure>> removeResearcherFromTeam({required  String researcherId });
}
