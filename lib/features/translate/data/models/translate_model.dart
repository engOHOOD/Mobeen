import 'package:mobeen/features/translate/domain/entities/translate_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'translate_model.freezed.dart';
part 'translate_model.g.dart';


@freezed
abstract class TranslateModel with _$TranslateModel {
  const factory TranslateModel({
    required String inputText,
    required String translatedText,
    required String detectedLanguage,
    required String targetLanguage,

  }) = _TranslateModel;

  factory TranslateModel.fromJson(Map<String, Object?> json) => _$TranslateModelFromJson(json);
}



extension TranslateModelMapper on TranslateModel {
  TranslateEntity toEntity() {
    return TranslateEntity(inputText: inputText, translatedText: translatedText, detectedLanguage: detectedLanguage, targetLanguage: targetLanguage);
  }
  }
