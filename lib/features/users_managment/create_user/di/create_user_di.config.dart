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
import 'package:mobeen/features/users_managment/create_user/data/datasources/create_user_remote_data_source.dart'
    as _i108;
import 'package:mobeen/features/users_managment/create_user/data/repositories/create_user_repository_data.dart'
    as _i7;
import 'package:mobeen/features/users_managment/create_user/domain/repositories/create_user_repository_domain.dart'
    as _i380;
import 'package:mobeen/features/users_managment/create_user/domain/use_cases/create_user_use_case.dart'
    as _i811;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCreateUser({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i108.BaseCreateUserRemoteDataSource>(
      () => _i108.CreateUserRemoteDataSource(
        gh<_i1057.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i380.CreateUserRepositoryDomain>(
      () => _i7.CreateUserRepositoryData(
        gh<_i108.BaseCreateUserRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i811.CreateUserUseCase>(
      () => _i811.CreateUserUseCase(gh<_i380.CreateUserRepositoryDomain>()),
    );
    return this;
  }
}
