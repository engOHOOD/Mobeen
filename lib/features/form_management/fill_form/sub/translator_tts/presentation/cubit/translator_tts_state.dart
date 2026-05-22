import 'package:equatable/equatable.dart';

abstract class TranslatorTtsState extends Equatable {
  const TranslatorTtsState();

  @override
  List<Object?> get props => [];
}

class TranslatorInitialState extends TranslatorTtsState {
  final String selectedLang;

  const TranslatorInitialState({this.selectedLang = "ar"});

  @override
  List<Object?> get props => [selectedLang];
}

class TranslatorLoadingState extends TranslatorTtsState {
  final String selectedLang;

  const TranslatorLoadingState({required this.selectedLang});

  @override
  List<Object?> get props => [selectedLang];
}

class TranslatorSuccessState extends TranslatorTtsState {
  final String selectedLang;
  final String translatedText;

  const TranslatorSuccessState({
    required this.selectedLang,
    required this.translatedText,
  });

  @override
  List<Object?> get props => [selectedLang, translatedText];
}

class TranslatorErrorState extends TranslatorTtsState {
  final String selectedLang;
  final String message;

  const TranslatorErrorState({
    required this.selectedLang,
    required this.message,
  });

  @override
  List<Object?> get props => [selectedLang, message];
}
