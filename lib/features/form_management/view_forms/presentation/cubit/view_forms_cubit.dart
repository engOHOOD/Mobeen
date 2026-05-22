import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/form_management/view_forms/domain/use_cases/view_forms_use_case.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/cubit/view_forms_state.dart';

class ViewFormsCubit extends Cubit<ViewFormsState> {
  final ViewFormsUseCase _viewFormsUseCase;

  ViewFormsCubit(this._viewFormsUseCase) : super(ViewFormsInitialState());

  Future<void> getViewFormsMethod() async {
    emit(ViewFormsLoadingState());
    final result = await _viewFormsUseCase.getViewForms();
    result.when(
      (success) {
        print('------$success');
        emit(ViewFormsSuccessState(forms: success));
      },
      (whenError) {
        emit(ViewFormsErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
