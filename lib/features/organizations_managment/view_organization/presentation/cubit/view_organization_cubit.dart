import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/use_cases/view_organization_use_case.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/cubit/view_organization_state.dart';

class ViewOrganizationCubit extends Cubit<ViewOrganizationState> {
  final ViewOrganizationUseCase _viewOrganizationUseCase;

  ViewOrganizationCubit(this._viewOrganizationUseCase)
    : super(ViewOrganizationInitialState()){getViewOrganizationMethod();}

  Future<void> getViewOrganizationMethod() async {
    final result = await _viewOrganizationUseCase.getViewOrganization();
    result.when(
      (success) {
        emit(ViewOrganizationSuccessState(organizations: success));
      },
      (whenError) {
        emit(ViewOrganizationErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
