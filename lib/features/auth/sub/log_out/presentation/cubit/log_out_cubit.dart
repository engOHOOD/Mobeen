import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/auth/sub/log_out/domain/use_cases/log_out_use_case.dart';
import 'package:mobeen/features/auth/sub/log_out/presentation/cubit/log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  final LogOutUseCase _logOutUseCase;

  LogOutCubit(this._logOutUseCase) : super(LogOutInitialState());

  Future<void> getLogOutMethod() async {
    final result = await _logOutUseCase.getLogOut();
    result.when(
      (success) {
        emit(LogOutSuccessState());
      },
      (whenError) {
        emit(LogOutErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
