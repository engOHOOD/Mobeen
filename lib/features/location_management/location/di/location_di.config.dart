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
import 'package:mobeen/features/location_management/location/data/datasources/location_remote_data_source.dart'
    as _i1025;
import 'package:mobeen/features/location_management/location/data/repositories/location_repository_data.dart'
    as _i719;
import 'package:mobeen/features/location_management/location/domain/repositories/location_repository_domain.dart'
    as _i480;
import 'package:mobeen/features/location_management/location/domain/use_cases/location_use_case.dart'
    as _i133;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLocation({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1025.BaseLocationRemoteDataSource>(
      () => _i1025.LocationRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i480.LocationRepositoryDomain>(
      () => _i719.LocationRepositoryData(
        gh<_i1025.BaseLocationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i133.LocationUseCase>(
      () => _i133.LocationUseCase(gh<_i480.LocationRepositoryDomain>()),
    );
    return this;
  }
}
