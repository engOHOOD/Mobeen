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
import 'package:mobeen/features/location_management/live_location/data/datasources/live_location_remote_data_source.dart'
    as _i55;
import 'package:mobeen/features/location_management/live_location/data/repositories/live_location_repository_data.dart'
    as _i91;
import 'package:mobeen/features/location_management/live_location/domain/repositories/live_location_repository_domain.dart'
    as _i760;
import 'package:mobeen/features/location_management/live_location/domain/use_cases/live_location_use_case.dart'
    as _i351;
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_cubit.dart'
    as _i935;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLiveLocation({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i55.BaseLiveLocationRemoteDataSource>(
      () => _i55.LiveLocationRemoteDataSource(
        gh<_i1057.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i760.LiveLocationRepositoryDomain>(
      () => _i91.LiveLocationRepositoryData(
        gh<_i55.BaseLiveLocationRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i351.LiveLocationUseCase>(
      () => _i351.LiveLocationUseCase(gh<_i760.LiveLocationRepositoryDomain>()),
    );
    gh.lazySingleton<_i935.LiveLocationCubit>(
      () => _i935.LiveLocationCubit(gh<_i351.LiveLocationUseCase>()),
    );
    return this;
  }
}
