import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/form_management/view_form/domain/use_cases/view_form_use_case.dart';
import 'package:mobeen/features/form_management/view_form/presentation/cubit/view_form_state.dart';

class ViewFormCubit extends Cubit<ViewFormState> {
  final ViewFormUseCase _viewFormUseCase;

  ViewFormCubit(this._viewFormUseCase) : super(ViewFormInitialState());

  Future<void> getViewFormMethod({required String formId}) async {
    final result = await _viewFormUseCase.getViewForm(formId: formId);
    result.when(
      (success) {
        emit(ViewFormSuccessState(questions: success));
      },
      (whenError) {
        emit(ViewFormErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
