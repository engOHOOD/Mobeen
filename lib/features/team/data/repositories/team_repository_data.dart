
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/common/models/user_model/user_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/team/data/datasources/team_remote_data_source.dart';
import 'package:mobeen/features/team/domain/repositories/team_repository_domain.dart';

@LazySingleton(as: TeamRepositoryDomain)
class TeamRepositoryData implements TeamRepositoryDomain{
  final BaseTeamRemoteDataSource remoteDataSource;
  TeamRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<UserEntity>, Failure>> getTeam() async {
    try {
      final response = await remoteDataSource.getTeam();
      return Success( response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<List<UserEntity>, Failure>> getAvailableResearchers() async {
    try {
      final response = await remoteDataSource.getAvailableResearchers();
      return Success( response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

    @override
  Future<Result<void, Failure>> addResearcherToTeam({required String researcherId})async {
 try {
      await remoteDataSource.addResearcherToTeam(researcherId:researcherId );
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  @override
  Future<Result<void, Failure>> removeResearcherFromTeam({required String researcherId}) async{
    try {
      await remoteDataSource.removeResearcherFromTeam(researcherId: researcherId);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
