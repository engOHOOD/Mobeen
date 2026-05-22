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
import 'package:mobeen/features/auth/log_in/data/datasources/log_in_remote_data_source.dart'
    as _i633;
import 'package:mobeen/features/auth/log_in/data/repositories/log_in_repository_data.dart'
    as _i125;
import 'package:mobeen/features/auth/log_in/domain/repositories/log_in_repository_domain.dart'
    as _i841;
import 'package:mobeen/features/auth/log_in/domain/use_cases/log_in_use_case.dart'
    as _i911;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLogIn({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i633.BaseLogInRemoteDataSource>(
      () => _i633.LogInRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i841.LogInRepositoryDomain>(
      () => _i125.LogInRepositoryData(gh<_i633.BaseLogInRemoteDataSource>()),
    );
    gh.lazySingleton<_i911.LogInUseCase>(
      () => _i911.LogInUseCase(gh<_i841.LogInRepositoryDomain>()),
    );
    return this;
  }
}
