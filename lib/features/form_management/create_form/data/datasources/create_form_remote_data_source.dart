import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:uuid/uuid.dart';

abstract class BaseCreateFormRemoteDataSource {
  Future<void> createForm({
    required String title,
    required String description,
    required int target,
    required List<AddQuestion> questions,
  });
}

@LazySingleton(as: BaseCreateFormRemoteDataSource)
class CreateFormRemoteDataSource implements BaseCreateFormRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  CreateFormRemoteDataSource(this._supabase, this._userService);

  @override
  Future<void> createForm({
    required String title,
    required String description,
    required int target,
    required List<AddQuestion> questions,
  }) async {
    try {
  
      final formId = Uuid().v4();
     await _supabase
          .from("forms")
          .insert({
            'id': formId,
            "user_id": _userService.getUser!.id,
            "title": title,
            "description": description,
            'target': target,
            "organisation_id": _userService.getUser!.organisationsId,
          })
          .select()
          .maybeSingle();
      final featureInsert = <Future>[];

      int i = 0;
      for (var element in questions) {
        featureInsert.add(
          _supabase.from("questions").insert({
            "id": Uuid().v4(),
            'form_id': formId,
            "question": element.label,
            "type": element.type.name,
            "is_required": element.required,
            "options": element.options,
            'sort': ++i,
          }).select(),
        );
      }

      await Future.wait(featureInsert, eagerError: true);
    } catch (error) {
      print("$error");

      throw FailureExceptions.getException(error);
    }
  }
}
