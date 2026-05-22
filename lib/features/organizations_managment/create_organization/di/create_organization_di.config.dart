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
import 'package:mobeen/features/organizations_managment/create_organization/data/datasources/create_organization_remote_data_source.dart'
    as _i556;
import 'package:mobeen/features/organizations_managment/create_organization/data/repositories/create_organization_repository_data.dart'
    as _i879;
import 'package:mobeen/features/organizations_managment/create_organization/domain/repositories/create_organization_repository_domain.dart'
    as _i710;
import 'package:mobeen/features/organizations_managment/create_organization/domain/use_cases/create_organization_use_case.dart'
    as _i1001;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCreateOrganization({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i556.BaseCreateOrganizationRemoteDataSource>(
      () =>
          _i556.CreateOrganizationRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i710.CreateOrganizationRepositoryDomain>(
      () => _i879.CreateOrganizationRepositoryData(
        gh<_i556.BaseCreateOrganizationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1001.CreateOrganizationUseCase>(
      () => _i1001.CreateOrganizationUseCase(
        gh<_i710.CreateOrganizationRepositoryDomain>(),
      ),
    );
    return this;
  }
}
