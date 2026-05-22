import 'dart:typed_data'; // Imported for Uint8List
import 'package:injectable/injectable.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/widgets/organization_card_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:uuid/uuid.dart';

abstract class BaseCreateOrganizationRemoteDataSource {
  Future<void> getCreateOrganization({
    required String email,
    required String organizationName,
    required String nationalAddress,
    required Uint8List? organizationLogoBytes,
    required String name,
    required String adminemail,
    required String phone,
  });
}

@LazySingleton(as: BaseCreateOrganizationRemoteDataSource)
class CreateOrganizationRemoteDataSource
    implements BaseCreateOrganizationRemoteDataSource {
  final SupabaseClient _supabase;

  CreateOrganizationRemoteDataSource(this._supabase);
  @override
  Future<void> getCreateOrganization({
    required String email,
    required String organizationName,
    required String nationalAddress,
    required Uint8List? organizationLogoBytes,
    required String name,
    required String adminemail,
    required String phone,
  }) async {
    try {
      String? publicImageUrl;

      if (organizationLogoBytes != null) {
        final String fileName = 'logo_${Uuid().v4()}.png';
        await _supabase.storage
            .from('images')
            .uploadBinary(
              fileName,
              organizationLogoBytes,
              fileOptions: const FileOptions(contentType: 'image/png'),
            );

        publicImageUrl = _supabase.storage
            .from('images')
            .getPublicUrl(fileName);
      }
      final organizationId = Uuid().v4();
      await _supabase.from('organisations').insert({
        'id':organizationId,
        'name': organizationName,
        'email': email,
        'national_address': nationalAddress,
        'organization_logo': publicImageUrl,
      }).select();

      await _supabase.functions.invoke(
        'invite-user',
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'role': 'admin',
          'organisations_id': organizationId,
        },
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
