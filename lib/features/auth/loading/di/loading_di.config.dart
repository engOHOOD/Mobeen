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
import 'package:mobeen/core/services/local_keys_service.dart' as _i417;
import 'package:mobeen/core/services/user_service.dart' as _i1057;
import 'package:mobeen/features/auth/loading/data/datasources/loading_remote_data_source.dart'
    as _i989;
import 'package:mobeen/features/auth/loading/data/repositories/loading_repository_data.dart'
    as _i798;
import 'package:mobeen/features/auth/loading/domain/repositories/loading_repository_domain.dart'
    as _i600;
import 'package:mobeen/features/auth/loading/domain/use_cases/loading_use_case.dart'
    as _i487;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoading({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i989.BaseLoadingRemoteDataSource>(
      () => _i989.LoadingRemoteDataSource(
        gh<_i417.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i600.LoadingRepositoryDomain>(
      () =>
          _i798.LoadingRepositoryData(gh<_i989.BaseLoadingRemoteDataSource>()),
    );
    gh.lazySingleton<_i487.LoadingUseCase>(
      () => _i487.LoadingUseCase(gh<_i600.LoadingRepositoryDomain>()),
    );
    return this;
  }
}
