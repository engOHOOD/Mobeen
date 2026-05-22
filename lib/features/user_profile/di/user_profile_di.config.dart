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
import 'package:mobeen/features/user_profile/data/datasources/user_profile_remote_data_source.dart'
    as _i528;
import 'package:mobeen/features/user_profile/data/repositories/user_profile_repository_data.dart'
    as _i251;
import 'package:mobeen/features/user_profile/domain/repositories/user_profile_repository_domain.dart'
    as _i165;
import 'package:mobeen/features/user_profile/domain/use_cases/user_profile_use_case.dart'
    as _i1048;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initUserProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i528.BaseUserProfileRemoteDataSource>(
      () => _i528.UserProfileRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i165.UserProfileRepositoryDomain>(
      () => _i251.UserProfileRepositoryData(
        gh<_i528.BaseUserProfileRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1048.UserProfileUseCase>(
      () => _i1048.UserProfileUseCase(gh<_i165.UserProfileRepositoryDomain>()),
    );
    return this;
  }
}
