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
import 'package:mobeen/core/services/recording_service.dart' as _i50;
import 'package:mobeen/core/services/translation_service.dart' as _i735;
import 'package:mobeen/features/translate/data/datasources/translate_remote_data_source.dart'
    as _i375;
import 'package:mobeen/features/translate/data/repositories/translate_repository_data.dart'
    as _i86;
import 'package:mobeen/features/translate/domain/repositories/translate_repository_domain.dart'
    as _i1051;
import 'package:mobeen/features/translate/domain/use_cases/translate_use_case.dart'
    as _i238;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTranslate({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i375.BaseTranslateRemoteDataSource>(
      () => _i375.TranslateRemoteDataSource(
        gh<_i50.RecordingService>(),
        gh<_i735.TranslationService>(),
      ),
    );
    gh.lazySingleton<_i1051.TranslateRepositoryDomain>(
      () => _i86.TranslateRepositoryData(
        gh<_i375.BaseTranslateRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i238.TranslateUseCase>(
      () => _i238.TranslateUseCase(gh<_i1051.TranslateRepositoryDomain>()),
    );
    return this;
  }
}
