import 'package:injectable/injectable.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/features/organizations_managment/view_organization/data/models/view_organization_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseViewOrganizationRemoteDataSource {
  Future<List<ViewOrganizationModel>> getViewOrganization();
}

@LazySingleton(as: BaseViewOrganizationRemoteDataSource)
class ViewOrganizationRemoteDataSource
    implements BaseViewOrganizationRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  ViewOrganizationRemoteDataSource(this._supabase, this._userService);

  @override
  Future<List<ViewOrganizationModel>> getViewOrganization() async {
    try {
      final response = await _supabase
          .from("organisations")
          .select()
          .neq('id', _userService.getUser!.organisationsId!);

      final organisations = response
          .map((o) => ViewOrganizationModel.fromJson(o))
          .toList();
      print(organisations);
      return organisations;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
