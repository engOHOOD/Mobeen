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
import 'package:mobeen/features/auth/set_password/data/datasources/set_password_remote_data_source.dart'
    as _i203;
import 'package:mobeen/features/auth/set_password/data/repositories/set_password_repository_data.dart'
    as _i238;
import 'package:mobeen/features/auth/set_password/domain/repositories/set_password_repository_domain.dart'
    as _i13;
import 'package:mobeen/features/auth/set_password/domain/use_cases/set_password_use_case.dart'
    as _i124;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSetPassword({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i203.BaseSetPasswordRemoteDataSource>(
      () => _i203.SetPasswordRemoteDataSource(
        gh<_i1057.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i13.SetPasswordRepositoryDomain>(
      () => _i238.SetPasswordRepositoryData(
        gh<_i203.BaseSetPasswordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i124.SetPasswordUseCase>(
      () => _i124.SetPasswordUseCase(gh<_i13.SetPasswordRepositoryDomain>()),
    );
    return this;
  }
}
