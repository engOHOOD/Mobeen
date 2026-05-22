import 'package:equatable/equatable.dart';

class TranslateEntity extends Equatable {
  final String inputText;
  final String translatedText;
  final String detectedLanguage;
  final String targetLanguage;


  const TranslateEntity({
    required this.inputText,
    required this.translatedText,
    required this.detectedLanguage,
    required this.targetLanguage,

  });

  @override
  List<Object?> get props => [inputText, translatedText, detectedLanguage, targetLanguage];
}
