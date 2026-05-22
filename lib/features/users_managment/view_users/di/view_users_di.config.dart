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
import 'package:mobeen/features/users_managment/view_users/data/datasources/view_users_remote_data_source.dart'
    as _i1022;
import 'package:mobeen/features/users_managment/view_users/data/repositories/view_users_repository_data.dart'
    as _i147;
import 'package:mobeen/features/users_managment/view_users/domain/repositories/view_users_repository_domain.dart'
    as _i914;
import 'package:mobeen/features/users_managment/view_users/domain/use_cases/view_users_use_case.dart'
    as _i1012;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initViewUsers({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1022.BaseViewUsersRemoteDataSource>(
      () => _i1022.ViewUsersRemoteDataSource(
        gh<_i417.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i914.ViewUsersRepositoryDomain>(
      () => _i147.ViewUsersRepositoryData(
        gh<_i1022.BaseViewUsersRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1012.ViewUsersUseCase>(
      () => _i1012.ViewUsersUseCase(gh<_i914.ViewUsersRepositoryDomain>()),
    );
    return this;
  }
}
