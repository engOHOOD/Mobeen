import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/auth/set_password/domain/use_cases/set_password_use_case.dart';
import 'package:mobeen/features/auth/set_password/presentation/cubit/set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  final SetPasswordUseCase _setPasswordUseCase;

  SetPasswordCubit(this._setPasswordUseCase) : super(SetPasswordInitialState());

  Future<void> getSetPasswordMethod({required String password}) async {
    emit(SetPasswordLoadingState());
    final result = await _setPasswordUseCase.getSetPassword(password: password);
    result.when(
      (success) {
        emit(SetPasswordSuccessState());
      },
      (whenError) {
        emit(SetPasswordErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
