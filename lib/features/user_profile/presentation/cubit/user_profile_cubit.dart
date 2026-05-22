import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/user_profile/domain/use_cases/user_profile_use_case.dart';
import 'package:mobeen/features/user_profile/presentation/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserProfileUseCase _userProfileUseCase;

  UserProfileCubit(this._userProfileUseCase) : super(UserProfileInitialState()){
    getUserProfileMethod();
  }

  Future<void> getUserProfileMethod() async {
    final result = await _userProfileUseCase.getUserProfile();
    result.when(
      (success) {
        emit(UserProfileSuccessState(user: success));
      },
      (whenError) {
        emit(UserProfileErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
