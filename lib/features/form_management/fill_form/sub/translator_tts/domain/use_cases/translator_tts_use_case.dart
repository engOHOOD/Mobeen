import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/entities/translator_tts_entity.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/repositories/translator_tts_repository_domain.dart';


@lazySingleton
class TranslatorTtsUseCase {
  final TranslatorTtsRepositoryDomain _repositoryData;

  TranslatorTtsUseCase(this._repositoryData);

   Future<Result<TranslatorTtsEntity, Failure>> getTranslatorTts() async {
    return _repositoryData.getTranslatorTts();
  }
}
