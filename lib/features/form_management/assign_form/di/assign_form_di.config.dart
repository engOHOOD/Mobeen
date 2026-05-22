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
import 'package:mobeen/features/form_management/assign_form/data/datasources/assign_form_remote_data_source.dart'
    as _i401;
import 'package:mobeen/features/form_management/assign_form/data/repositories/assign_form_repository_data.dart'
    as _i828;
import 'package:mobeen/features/form_management/assign_form/domain/repositories/assign_form_repository_domain.dart'
    as _i618;
import 'package:mobeen/features/form_management/assign_form/domain/use_cases/assign_form_use_case.dart'
    as _i188;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAssignForm({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i401.BaseAssignFormRemoteDataSource>(
      () => _i401.AssignFormRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i618.AssignFormRepositoryDomain>(
      () => _i828.AssignFormRepositoryData(
        gh<_i401.BaseAssignFormRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i188.AssignFormUseCase>(
      () => _i188.AssignFormUseCase(gh<_i618.AssignFormRepositoryDomain>()),
    );
    return this;
  }
}
