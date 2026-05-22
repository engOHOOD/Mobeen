import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/form_model/form_model.dart';
import 'package:mobeen/core/common/models/question_model/question_model.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/form_management/fill_form/data/models/generate_form_model/generate_form_model.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/fill_form_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:uuid/uuid.dart';

abstract class BaseFillFormRemoteDataSource {
  Future<GenerateFormModel> getForm({required String formId});
  Future<void> submit({required List<FillFormEntity> submitAnswers});
}

@LazySingleton(as: BaseFillFormRemoteDataSource)
class FillFormRemoteDataSource implements BaseFillFormRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalKeysService _localKeysService;

  FillFormRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._userService,
  );

  @override
  Future<GenerateFormModel> getForm({required String formId}) async {
    try {
      print('--------$formId');
      final formResponse = await _supabase
          .from("forms")
          .select()
          .eq('id', formId)
          .single();

      final form = FormModel.fromJson(formResponse);
      print('--4------');

      final questionsResponse = await _supabase
          .from("questions")
          .select()
          .eq('form_id', formId);

      final questions = questionsResponse
          .map((u) => QuestionModel.fromJson(u))
          .toList();
      print('-5-------');

      return GenerateFormModel(form: form, questions: questions);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> submit({required List<FillFormEntity> submitAnswers}) async {
    try {
      final featureInsert = <Future>[];
      print("hereeee");

      for (var element in submitAnswers) {
        featureInsert.add(
          _supabase.from("form_answers").insert({
            "id": Uuid().v4(),
            'form_id': element.formId,
            'question_id': element.questionId,
            'user_id': _userService.getUser!.id,
            'answer': element.answer,
          }).select(),
        );
      }
      print('--4------');

      await Future.wait(featureInsert, eagerError: true);
      print('-5-------');
    } catch (error) {
      print(error);
      throw FailureExceptions.getException(error);
    }
  }
}
