import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/form_model/form_model.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseViewFormsRemoteDataSource {
  Future<List<FormModel>> getViewForms();
}

@LazySingleton(as: BaseViewFormsRemoteDataSource)
class ViewFormsRemoteDataSource implements BaseViewFormsRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  ViewFormsRemoteDataSource(
    this._supabase,
    this._userService,
  );

  @override
  Future<List<FormModel>> getViewForms() async {
    try {
      print('ijiji');
      final response = await _supabase
          .from("forms")
          .select()
          .eq('organisation_id', _userService.getUser!.organisationsId!);
      print('-----');

      final forms = response.map((u) => FormModel.fromJson(u)).toList();

      return forms;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
