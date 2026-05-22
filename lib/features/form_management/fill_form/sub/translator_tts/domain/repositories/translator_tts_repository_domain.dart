import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/entities/translator_tts_entity.dart';

abstract class TranslatorTtsRepositoryDomain {
    Future<Result<TranslatorTtsEntity, Failure>> getTranslatorTts();
}
