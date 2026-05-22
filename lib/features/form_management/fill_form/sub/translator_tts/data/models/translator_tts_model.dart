import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/domain/entities/translator_tts_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'translator_tts_model.freezed.dart';
part 'translator_tts_model.g.dart';

@freezed
abstract class TranslatorTtsModel with _$TranslatorTtsModel {
  const factory TranslatorTtsModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _TranslatorTtsModel;

  factory TranslatorTtsModel.fromJson(Map<String, Object?> json) => _$TranslatorTtsModelFromJson(json);
}



extension TranslatorTtsModelMapper on TranslatorTtsModel {
  TranslatorTtsEntity toEntity() {
    return TranslatorTtsEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
