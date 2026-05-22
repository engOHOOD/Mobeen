import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/home/user_home/domain/use_cases/user_home_use_case.dart';
import 'package:mobeen/features/home/user_home/presentation/cubit/user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  final UserHomeUseCase _userHomeUseCase;

  UserHomeCubit(this._userHomeUseCase) : super(UserHomeInitialState());

  Future<void> getUserHomeMethod() async {
    final result = await _userHomeUseCase.getUserHome();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
