import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/core/services/translation_service.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/presentation/cubit/translator_tts_state.dart';

class TranslatorTtsCubit extends Cubit<TranslatorTtsState> {
  final TranslationService translationService;

  TranslatorTtsCubit({
    required this.translationService,
  }) : super(const TranslatorInitialState());

  // 1. ADDED THIS METHOD: This fixes your compilation error!
  void changeLanguage(String langCode) {
    emit(TranslatorInitialState(selectedLang: langCode));
  }

  String _getCurrentLang() {
    final currentState = state;
    if (currentState is TranslatorInitialState) return currentState.selectedLang;
    if (currentState is TranslatorLoadingState) return currentState.selectedLang;
    if (currentState is TranslatorSuccessState) return currentState.selectedLang;
    if (currentState is TranslatorErrorState) return currentState.selectedLang;
    return "ar";
  }

  String _getTtsLanguageCode(String lang) {
    switch (lang) {
      case "ar": return "ar-SA";
      case "en": return "en-US";
      case "fr": return "fr-FR";
      case "es": return "es-ES";
      default: return "en-US";
    }
  }

  Future<void> translateAndSpeak(String inputText) async {
    final textToTranslate = inputText.trim();
    if (textToTranslate.isEmpty) return;

    final currentLang = _getCurrentLang();
    emit(TranslatorLoadingState(selectedLang: currentLang));

    try {
      // 2. FIXED: Setup the handler using a local callback closure inside the try block
      translationService.setErrorHandler((msg) {
        if (!isClosed) {
          emit(TranslatorErrorState(
            selectedLang: _getCurrentLang(), // Dynamically read the active lang
            message: "TTS Engine Error: $msg",
          ));
        }
      });

      // 3. Translate Text
      final translatedText = await translationService.translateText(
        textToTranslate, 
        currentLang,
      );

      emit(TranslatorSuccessState(
        selectedLang: currentLang,
        translatedText: translatedText,
      ));

      // 4. Initialize and play TTS lazily
      await translationService.init();
      final languageCode = _getTtsLanguageCode(currentLang);
      await translationService.speak(translatedText, languageCode);
      
    } catch (e) {
      emit(TranslatorErrorState(
        selectedLang: currentLang,
        message: e.toString().replaceAll("Exception: ", ""),
      ));
    }
  }

  @override
  Future<void> close() async {
    await translationService.stop();
    return super.close();
  }
}