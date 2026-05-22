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
import 'package:mobeen/features/organizations_managment/view_organization/data/datasources/view_organization_remote_data_source.dart'
    as _i98;
import 'package:mobeen/features/organizations_managment/view_organization/data/repositories/view_organization_repository_data.dart'
    as _i926;
import 'package:mobeen/features/organizations_managment/view_organization/domain/repositories/view_organization_repository_domain.dart'
    as _i111;
import 'package:mobeen/features/organizations_managment/view_organization/domain/use_cases/view_organization_use_case.dart'
    as _i517;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initViewOrganization({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i98.BaseViewOrganizationRemoteDataSource>(
      () => _i98.ViewOrganizationRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i111.ViewOrganizationRepositoryDomain>(
      () => _i926.ViewOrganizationRepositoryData(
        gh<_i98.BaseViewOrganizationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i517.ViewOrganizationUseCase>(
      () => _i517.ViewOrganizationUseCase(
        gh<_i111.ViewOrganizationRepositoryDomain>(),
      ),
    );
    return this;
  }
}
