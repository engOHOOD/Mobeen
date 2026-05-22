import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/network/gladia_client.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';

@lazySingleton
class TranslationService {
  final GladiaClient gladiaClient;
  final GoogleTranslator _translator = GoogleTranslator();
  final FlutterTts _tts = FlutterTts();

  TranslationService(this.gladiaClient);

  String? pilgrimLanguage; 
  bool sessionReady = false;

  Future<Map<String, dynamic>?> processAudio(String path) async {
    try {
      final file = File(path);
      if (!await file.exists()) throw Exception("File not found");

      // 1. Upload and Transcribe via Gladia
      final url = await gladiaClient.uploadAudio(file: file);
      final id = await gladiaClient.startTranscription(audioUrl: url);
      final result = await gladiaClient.getTranscriptionResult(transcriptionId: id);

      final transcriptionMap = result['transcription'] as Map<String, dynamic>? ?? {};
      final transcript = transcriptionMap['full_transcript']?.toString() ?? '';
      
      final languagesList = transcriptionMap['languages'] as List? ?? [];
      String detectedRaw = '';
      if (languagesList.isNotEmpty) {
        detectedRaw = languagesList.first is Map 
            ? (languagesList.first['language'] ?? '').toString()
            : languagesList.first.toString();
      }

      // 2. Pass to the conversation handler
      return handleConversation(transcript: transcript, detected: detectedRaw);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> processText(String text) async {
    try {
      // Use google_translator for detection
      final detection = await _translator.translate(text);
      final detectedCode = detection.sourceLanguage.code;

      return handleConversation(transcript: text, detected: detectedCode);
    } catch (e) {
      rethrow;
    }
  }

  // The central logic used by both Text and Audio
  Future<Map<String, dynamic>?> handleConversation({
    required String transcript,
    required String detected,
  }) async {
    final detectedCode = _getLanguageCode(detected);

    if (!sessionReady) {
      if (detectedCode != 'ar') {
        pilgrimLanguage = detectedCode;
        sessionReady = true;
      } else {
        // If it's Arabic but session not ready, we return the original text
        return {
          "inputText": transcript,
          "translatedText": transcript, 
          "detectedLanguage": 'ar',
          "targetLanguage": 'ar',
        };
      }
    }

    final targetLanguageCode = (detectedCode == 'ar') 
        ? (pilgrimLanguage ?? 'en') 
        : 'ar';

    final translated = await translate(transcript, targetLanguageCode);

    return {
      "inputText": transcript,
      "translatedText": translated,
      "detectedLanguage": detectedCode,
      "targetLanguage": targetLanguageCode,
    };
  }

  Future<String> translate(String text, String targetLanguageCode) async {
    final translation = await _translator.translate(text, to: targetLanguageCode);
    return translation.text;
  }

  // Support for Cubit direct calls
  Future<String> translateText(String text, String targetCode) async => translate(text, targetCode);

  String _getLanguageCode(String input) {
    final Map<String, String> langMap = {
      'arabic': 'ar', 'english': 'en', 'french': 'fr',
      'urdu': 'ur', 'hindi': 'hi', 'indonesian': 'id', 'turkish': 'tr',
    };
    final clean = input.toLowerCase().trim();
    return langMap[clean] ?? clean;
  }

  void resetSession() {
    pilgrimLanguage = null;
    sessionReady = false;
  }

  // TTS Methods
  Future<void> init() async {}
  Future<void> stop() async => await _tts.stop();
  void setErrorHandler(Function(String) handler) => _tts.setErrorHandler((msg) => handler(msg));
  Future<void> speak(String text, String languageCode) async {
    await _tts.setLanguage(languageCode);
    await _tts.speak(text);
  }
}