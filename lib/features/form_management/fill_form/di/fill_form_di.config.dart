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
import 'package:mobeen/features/form_management/fill_form/data/datasources/fill_form_remote_data_source.dart'
    as _i145;
import 'package:mobeen/features/form_management/fill_form/data/repositories/fill_form_repository_data.dart'
    as _i1057;
import 'package:mobeen/features/form_management/fill_form/domain/repositories/fill_form_repository_domain.dart'
    as _i373;
import 'package:mobeen/features/form_management/fill_form/domain/use_cases/fill_form_use_case.dart'
    as _i223;
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/data/datasources/translator_tts_remote_data_source.dart'
    as _i1015;
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/data/repositories/translator_tts_repository_data.dart'
    as _i240;
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/repositories/translator_tts_repository_domain.dart'
    as _i632;
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/use_cases/translator_tts_use_case.dart'
    as _i329;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initFillForm({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i145.BaseFillFormRemoteDataSource>(
      () => _i145.FillFormRemoteDataSource(
        gh<_i417.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i1057.UserService>(),
      ),
    );
    gh.lazySingleton<_i373.FillFormRepositoryDomain>(
      () => _i1057.FillFormRepositoryData(
        gh<_i145.BaseFillFormRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1015.BaseTranslatorTtsRemoteDataSource>(
      () => _i1015.TranslatorTtsRemoteDataSource(
        gh<_i417.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i632.TranslatorTtsRepositoryDomain>(
      () => _i240.TranslatorTtsRepositoryData(
        gh<_i1015.BaseTranslatorTtsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i223.FillFormUseCase>(
      () => _i223.FillFormUseCase(gh<_i373.FillFormRepositoryDomain>()),
    );
    gh.lazySingleton<_i329.TranslatorTtsUseCase>(
      () =>
          _i329.TranslatorTtsUseCase(gh<_i632.TranslatorTtsRepositoryDomain>()),
    );
    return this;
  }
}
