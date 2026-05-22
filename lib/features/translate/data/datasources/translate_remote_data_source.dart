import 'package:injectable/injectable.dart';
import 'package:mobeen/core/services/recording_service.dart';
import 'package:mobeen/core/services/translation_service.dart';
import 'package:mobeen/features/translate/data/models/translate_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseTranslateRemoteDataSource {
  Future<bool> startRecording();
  Future<TranslateModel> stopRecording();
  Future<TranslateModel> sendText(String text);
  Future<void> resetSession();
}

@LazySingleton(as: BaseTranslateRemoteDataSource)
class TranslateRemoteDataSource implements BaseTranslateRemoteDataSource {
  final RecordingService _recordingService;
  final TranslationService _translationService;

  TranslateRemoteDataSource(this._recordingService, this._translationService);

  @override
  Future<bool> startRecording() async {
    try {
      await _recordingService.startRecording();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<TranslateModel> stopRecording() async {
    try {
      final path = await _recordingService.stopRecording();
      if (path == null) throw Exception("Recording failed or was cancelled");

      // processAudio now uses Gladia for STT + Google Translator for the logic
      final result = await _translationService.processAudio(path);
      
      if (result == null) {
        // This happens if the service is waiting for a non-Arabic speaker
        throw Exception("Waiting for pilgrim to speak...");
      }

      return TranslateModel.fromJson(result);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<TranslateModel> sendText(String text) async {
    try {
      // processText uses Google Translator for detection and translation
      final result = await _translationService.processText(text);
      
      if (result == null) {
        throw Exception("Could not process text input");
      }

      return TranslateModel.fromJson(result);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> resetSession() async {
    try {
      _translationService.resetSession();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}