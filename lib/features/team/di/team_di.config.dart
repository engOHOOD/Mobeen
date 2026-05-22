// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobeen/core/services/user_service.dart' as _i1057;
import 'package:mobeen/features/team/data/datasources/team_remote_data_source.dart'
    as _i673;
import 'package:mobeen/features/team/data/repositories/team_repository_data.dart'
    as _i809;
import 'package:mobeen/features/team/domain/repositories/team_repository_domain.dart'
    as _i113;
import 'package:mobeen/features/team/domain/use_cases/team_use_case.dart'
    as _i239;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTeam({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i673.BaseTeamRemoteDataSource>(
      () => _i673.TeamRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i113.TeamRepositoryDomain>(
      () => _i809.TeamRepositoryData(gh<_i673.BaseTeamRemoteDataSource>()),
    );
    gh.lazySingleton<_i239.TeamUseCase>(
      () => _i239.TeamUseCase(gh<_i113.TeamRepositoryDomain>()),
    );
    return this;
  }
}
