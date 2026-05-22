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
import 'package:mobeen/features/form_management/create_form/data/datasources/create_form_remote_data_source.dart'
    as _i614;
import 'package:mobeen/features/form_management/create_form/data/repositories/create_form_repository_data.dart'
    as _i1010;
import 'package:mobeen/features/form_management/create_form/domain/repositories/create_form_repository_domain.dart'
    as _i699;
import 'package:mobeen/features/form_management/create_form/domain/use_cases/create_form_use_case.dart'
    as _i837;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCreateForm({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i614.BaseCreateFormRemoteDataSource>(
      () => _i614.CreateFormRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i699.CreateFormRepositoryDomain>(
      () => _i1010.CreateFormRepositoryData(
        gh<_i614.BaseCreateFormRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i837.CreateFormUseCase>(
      () => _i837.CreateFormUseCase(gh<_i699.CreateFormRepositoryDomain>()),
    );
    return this;
  }
}
