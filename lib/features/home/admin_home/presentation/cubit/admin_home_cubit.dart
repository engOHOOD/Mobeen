import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/home/admin_home/domain/use_cases/admin_home_use_case.dart';
import 'package:mobeen/features/home/admin_home/presentation/cubit/admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  final AdminHomeUseCase _adminHomeUseCase;

  AdminHomeCubit(this._adminHomeUseCase) : super(AdminHomeInitialState());

  Future<void> getAdminHomeMethod() async {
    final result = await _adminHomeUseCase.getAdminHome();
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
