import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/translate/domain/entities/translate_entity.dart';
import 'package:mobeen/features/translate/domain/repositories/translate_repository_domain.dart';


@lazySingleton
class TranslateUseCase {
  final TranslateRepositoryDomain _repositoryData;

  TranslateUseCase(this._repositoryData);

   Future<Result<bool, Failure>> startRecording() async {
    return _repositoryData.startRecording();
  }
   Future<Result<TranslateEntity, Failure>> stopRecording() async {
    return _repositoryData.stopRecording();
  }
  Future<Result<TranslateEntity, Failure>> sendText(String text)async {
    return _repositoryData.sendText(text);
  }
 Future<Result<void, Failure>> resetSession()async {
    return _repositoryData.resetSession();
  }
}
