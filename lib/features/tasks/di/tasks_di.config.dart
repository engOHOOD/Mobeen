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
import 'package:mobeen/features/tasks/data/datasources/tasks_remote_data_source.dart'
    as _i888;
import 'package:mobeen/features/tasks/data/repositories/tasks_repository_data.dart'
    as _i1039;
import 'package:mobeen/features/tasks/domain/repositories/tasks_repository_domain.dart'
    as _i839;
import 'package:mobeen/features/tasks/domain/use_cases/tasks_use_case.dart'
    as _i393;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTasks({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i888.BaseTasksRemoteDataSource>(
      () => _i888.TasksRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i839.TasksRepositoryDomain>(
      () => _i1039.TasksRepositoryData(gh<_i888.BaseTasksRemoteDataSource>()),
    );
    gh.lazySingleton<_i393.TasksUseCase>(
      () => _i393.TasksUseCase(gh<_i839.TasksRepositoryDomain>()),
    );
    return this;
  }
}
