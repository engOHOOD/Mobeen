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
import 'package:mobeen/features/form_management/view_forms/data/datasources/view_forms_remote_data_source.dart'
    as _i193;
import 'package:mobeen/features/form_management/view_forms/data/repositories/view_forms_repository_data.dart'
    as _i761;
import 'package:mobeen/features/form_management/view_forms/domain/repositories/view_forms_repository_domain.dart'
    as _i878;
import 'package:mobeen/features/form_management/view_forms/domain/use_cases/view_forms_use_case.dart'
    as _i101;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initViewForms({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i193.BaseViewFormsRemoteDataSource>(
      () => _i193.ViewFormsRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i878.ViewFormsRepositoryDomain>(
      () => _i761.ViewFormsRepositoryData(
        gh<_i193.BaseViewFormsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i101.ViewFormsUseCase>(
      () => _i101.ViewFormsUseCase(gh<_i878.ViewFormsRepositoryDomain>()),
    );
    return this;
  }
}
