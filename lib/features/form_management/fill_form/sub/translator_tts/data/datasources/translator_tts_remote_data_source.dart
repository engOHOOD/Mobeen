import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/data/models/translator_tts_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';


abstract class BaseTranslatorTtsRemoteDataSource {
  Future<TranslatorTtsModel> getTranslatorTts();
}


@LazySingleton(as: BaseTranslatorTtsRemoteDataSource)
class TranslatorTtsRemoteDataSource implements BaseTranslatorTtsRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   TranslatorTtsRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<TranslatorTtsModel> getTranslatorTts() async {
    try {
      return TranslatorTtsModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
