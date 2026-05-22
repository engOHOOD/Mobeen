import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/organizations_managment/create_organization/domain/use_cases/create_organization_use_case.dart';
import 'package:mobeen/features/organizations_managment/create_organization/presentation/cubit/create_organization_state.dart';

class CreateOrganizationCubit extends Cubit<CreateOrganizationState> {
  final CreateOrganizationUseCase _createOrganizationUseCase;

  CreateOrganizationCubit(this._createOrganizationUseCase)
    : super(CreateOrganizationInitialState());

  Future<void> getCreateOrganizationMethod({
    required String email,
    required String organizationName,
    required String nationalAddress,
    required Uint8List? organizationLogoBytes,
    required String name,
    required String adminemail,
    required String phone,
  }) async {
    emit(CreateOrganizationLoadingState());
    final result = await _createOrganizationUseCase.getCreateOrganization(
      email: email,
      organizationName: organizationName,
      nationalAddress: nationalAddress,
      organizationLogoBytes: organizationLogoBytes,
      name: name,
      adminemail: adminemail,
      phone: phone,
    );
    result.when(
      (success) {
        emit(CreateOrganizationSuccessState());
      },
      (whenError) {
        emit(CreateOrganizationErrorState(message: whenError.message));
      },
    );
  }

  Future<void> updateImage(File imageFile) async {
    emit(CreateOrganizationLoadingState());
  }
}
