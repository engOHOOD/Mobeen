import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/users_managment/view_users/domain/use_cases/view_users_use_case.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/cubit/view_users_state.dart';

class ViewUsersCubit extends Cubit<ViewUsersState> {
  final ViewUsersUseCase _viewUsersUseCase;

  ViewUsersCubit(this._viewUsersUseCase) : super(ViewUsersInitialState());

  Future<void> getViewUsersMethod() async {
    final result = await _viewUsersUseCase.getViewUsers();
    result.when(
      (success) {
        emit(ViewUsersSuccessState(users: success));
      },
      (whenError) {
        emit(ViewUsersErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
