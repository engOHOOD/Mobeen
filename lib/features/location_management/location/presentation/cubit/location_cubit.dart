import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';
import 'package:mobeen/features/location_management/location/domain/use_cases/location_use_case.dart';
import 'package:mobeen/features/location_management/location/presentation/cubit/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationUseCase _locationUseCase;

  LocationCubit(this._locationUseCase) : super(LocationInitialState()) {
    getLocations();
  }

  Future<void> addLocation(LocationEntity location) async {
    emit(LocationLoadingState());
    print(location);
    final result = await _locationUseCase.addLocation(location);
    result.when(
      (success) async  {
        emit(AddLocationSuccessState());
        await getLocations();
      },
      (whenError) {
        emit(LocationErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getLocations() async {
    final result = await _locationUseCase.getLocations();
    result.when(
      (success) {
        emit(GetLocationsSuccessState(success));
      },
      (whenError) {
        emit(LocationErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
