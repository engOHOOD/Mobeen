// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../network/dio_client.dart' as _i667;
import '../network/gemini_client.dart' as _i732;
import '../network/gladia_client.dart' as _i642;
import '../services/local_keys_service.dart' as _i945;
import '../services/location_service.dart' as _i669;
import '../services/recording_service.dart' as _i889;
import '../services/translation_service.dart' as _i298;
import '../services/user_service.dart' as _i381;
import 'third_part.dart' as _i423;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyConfig = _$ThirdPartyConfig();
    gh.lazySingleton<_i792.GetStorage>(() => thirdPartyConfig.storage);
    gh.lazySingleton<_i454.SupabaseClient>(
      () => thirdPartyConfig.supabaseClient,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => thirdPartyConfig.flutterSecureStorage,
    );
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i732.GeminiClient>(() => _i732.GeminiClient());
    gh.lazySingleton<_i669.LocationService>(() => _i669.LocationService());
    gh.lazySingleton<_i889.RecordingService>(() => _i889.RecordingService());
    gh.lazySingleton<_i381.UserService>(() => _i381.UserService());
    gh.lazySingleton<_i642.GladiaClient>(
      () => _i642.GladiaClient(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i298.TranslationService>(
      () => _i298.TranslationService(gh<_i642.GladiaClient>()),
    );
    gh.singleton<_i945.LocalKeysService>(() => _i945.LocalKeysService());
    return this;
  }
}

class _$ThirdPartyConfig extends _i423.ThirdPartyConfig {}
