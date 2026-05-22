import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/form_management/assign_form/domain/use_cases/assign_form_use_case.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/cubit/assign_form_state.dart';

class AssignFormCubit extends Cubit<AssignFormState> {
  final AssignFormUseCase _assignFormUseCase;

  AssignFormCubit(this._assignFormUseCase) : super(AssignFormInitialState());

  Future<void> getAssignFormMethod({required String formId}) async {
    final result = await _assignFormUseCase.getAssignForm(formId: formId);
    result.when(
      (success) {
        emit(AssignFormSuccessState(team: success));
      },
      (whenError) {
        emit(AssignFormErrorState(message: whenError.message));
      },
    );
  }

  Future<void> assignForm({
    required String userId,
    required String formId,
    required String target,
  }) async {
    print('2');

    final result = await _assignFormUseCase.assignForm(
      userId: userId,
      formId: formId,
      target: target,
    );
    result.when(
      (success) {
        getAssignFormMethod(formId: formId);
      },
      (whenError) {
        emit(AssignFormErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
