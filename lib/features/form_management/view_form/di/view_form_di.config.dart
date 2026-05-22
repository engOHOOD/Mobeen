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
import 'package:mobeen/features/form_management/view_form/data/datasources/view_form_remote_data_source.dart'
    as _i743;
import 'package:mobeen/features/form_management/view_form/data/repositories/view_form_repository_data.dart'
    as _i314;
import 'package:mobeen/features/form_management/view_form/domain/repositories/view_form_repository_domain.dart'
    as _i446;
import 'package:mobeen/features/form_management/view_form/domain/use_cases/view_form_use_case.dart'
    as _i113;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initViewForm({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i743.BaseViewFormRemoteDataSource>(
      () => _i743.ViewFormRemoteDataSource(
        gh<_i417.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i446.ViewFormRepositoryDomain>(
      () => _i314.ViewFormRepositoryData(
        gh<_i743.BaseViewFormRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i113.ViewFormUseCase>(
      () => _i113.ViewFormUseCase(gh<_i446.ViewFormRepositoryDomain>()),
    );
    return this;
  }
}
