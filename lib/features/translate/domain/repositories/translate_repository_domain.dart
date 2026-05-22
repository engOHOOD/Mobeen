import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/translate/domain/entities/translate_entity.dart';

abstract class TranslateRepositoryDomain {
  Future<Result<bool, Failure>> startRecording();
  Future<Result<TranslateEntity, Failure>> stopRecording();
  Future<Result<TranslateEntity, Failure>> sendText(String text);
  Future<Result<void, Failure>> resetSession();
}
