import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/question_model/question_model.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseViewFormRemoteDataSource {
  Future<List<QuestionModel>> getViewForm({required String formId});
}

@LazySingleton(as: BaseViewFormRemoteDataSource)
class ViewFormRemoteDataSource implements BaseViewFormRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalKeysService _localKeysService;

  ViewFormRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._userService,
  );

  @override
  Future<List<QuestionModel>> getViewForm({required String formId}) async {
    try {
      final response = await _supabase
          .from("questions")
          .select()
          .eq('form_id', formId);

      final questions = response.map((u) => QuestionModel.fromJson(u)).toList();

      return questions;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
