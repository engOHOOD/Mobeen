import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/auth/log_in/domain/use_cases/log_in_use_case.dart';
import 'package:mobeen/features/auth/log_in/presentation/cubit/log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInUseCase _logInUseCase;

  LogInCubit(this._logInUseCase) : super(LogInInitialState());

  Future<void> getLogInMethod({
    required String email,
    required String password,
  }) async {
    emit(LogInLoadingState());
    final result = await _logInUseCase.getLogIn(
      email: email,
      password: password,
    );
    result.when(
      (success) {
        emit(LogInSuccessState());
      },
      (whenError) {
        emit(LogInErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
