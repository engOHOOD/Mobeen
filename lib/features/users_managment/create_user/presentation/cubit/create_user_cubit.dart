import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/users_managment/create_user/domain/use_cases/create_user_use_case.dart';
import 'package:mobeen/features/users_managment/create_user/presentation/cubit/create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final CreateUserUseCase _createUserUseCase;

  CreateUserCubit(this._createUserUseCase) : super(CreateUserInitialState());

  Future<void> getCreateUserMethod({
    required String name,
    required String email,
    required String phone,
    required String role,
  }) async {
    emit(CreateUserLoadingState());
    final result = await _createUserUseCase.getCreateUser(
      name: name,
      email: email,
      phone: phone,
      role: role,
    );
    result.when(
      (success) {
        emit(CreateUserSuccessState());
      },
      (whenError) {
        emit(CreateUserErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
