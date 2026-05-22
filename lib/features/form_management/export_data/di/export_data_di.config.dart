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
import 'package:mobeen/features/form_management/export_data/data/datasources/export_data_remote_data_source.dart'
    as _i992;
import 'package:mobeen/features/form_management/export_data/data/repositories/export_data_repository_data.dart'
    as _i533;
import 'package:mobeen/features/form_management/export_data/domain/repositories/export_data_repository_domain.dart'
    as _i465;
import 'package:mobeen/features/form_management/export_data/domain/use_cases/export_data_use_case.dart'
    as _i628;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initExportData({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i992.BaseExportDataRemoteDataSource>(
      () => _i992.ExportDataRemoteDataSource(
        gh<_i1057.UserService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i417.LocalKeysService>(),
      ),
    );
    gh.lazySingleton<_i465.ExportDataRepositoryDomain>(
      () => _i533.ExportDataRepositoryData(
        gh<_i992.BaseExportDataRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i628.ExportDataUseCase>(
      () => _i628.ExportDataUseCase(gh<_i465.ExportDataRepositoryDomain>()),
    );
    return this;
  }
}
