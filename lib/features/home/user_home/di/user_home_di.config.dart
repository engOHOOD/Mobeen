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
import 'package:mobeen/features/home/user_home/data/datasources/user_home_remote_data_source.dart'
    as _i329;
import 'package:mobeen/features/home/user_home/data/repositories/user_home_repository_data.dart'
    as _i343;
import 'package:mobeen/features/home/user_home/domain/repositories/user_home_repository_domain.dart'
    as _i850;
import 'package:mobeen/features/home/user_home/domain/use_cases/user_home_use_case.dart'
    as _i123;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initUserHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i329.BaseUserHomeRemoteDataSource>(
      () => _i329.UserHomeRemoteDataSource(
        gh<_i417.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i850.UserHomeRepositoryDomain>(
      () => _i343.UserHomeRepositoryData(
        gh<_i329.BaseUserHomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i123.UserHomeUseCase>(
      () => _i123.UserHomeUseCase(gh<_i850.UserHomeRepositoryDomain>()),
    );
    return this;
  }
}
