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
import 'package:mobeen/features/auth/sub/log_out/data/datasources/log_out_remote_data_source.dart'
    as _i178;
import 'package:mobeen/features/auth/sub/log_out/data/repositories/log_out_repository_data.dart'
    as _i259;
import 'package:mobeen/features/auth/sub/log_out/domain/repositories/log_out_repository_domain.dart'
    as _i282;
import 'package:mobeen/features/auth/sub/log_out/domain/use_cases/log_out_use_case.dart'
    as _i504;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogOutSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i178.BaseLogOutRemoteDataSource>(
      () => _i178.LogOutRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i282.LogOutRepositoryDomain>(
      () => _i259.LogOutRepositoryData(gh<_i178.BaseLogOutRemoteDataSource>()),
    );
    gh.lazySingleton<_i504.LogOutUseCase>(
      () => _i504.LogOutUseCase(gh<_i282.LogOutRepositoryDomain>()),
    );
    return this;
  }
}
