
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/entities/translator_tts_entity.dart';

import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/data/datasources/translator_tts_remote_data_source.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/data/models/translator_tts_model.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/repositories/translator_tts_repository_domain.dart';

@LazySingleton(as: TranslatorTtsRepositoryDomain)
class TranslatorTtsRepositoryData implements TranslatorTtsRepositoryDomain{
  final BaseTranslatorTtsRemoteDataSource remoteDataSource;


  TranslatorTtsRepositoryData(this.remoteDataSource);

@override
  Future<Result<TranslatorTtsEntity, Failure>> getTranslatorTts() async {
    try {
      final response = await remoteDataSource.getTranslatorTts();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
