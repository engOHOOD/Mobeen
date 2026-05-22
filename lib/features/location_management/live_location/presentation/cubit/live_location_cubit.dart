import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:mobeen/features/location_management/live_location/domain/use_cases/live_location_use_case.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_state.dart';

@lazySingleton
class LiveLocationCubit extends Cubit<LiveLocationState> {
  final LiveLocationUseCase _liveLocationUseCase;

  StreamSubscription? _subscription;

  Timer? _liveLocationTimer;

  bool _isStreaming = false;

  LiveLocationCubit(this._liveLocationUseCase)
      : super(LiveLocationInitialState());

  Future<void> updateLiveLocation(
    LiveLocationEntity entity,
  ) async {
    emit(LiveLocationLoading());

    final result =
        await _liveLocationUseCase.updateLiveLocation(entity);

    result.when(
      (success) {},
      (error) {
        emit(
          LiveLocationErrorState(
            message: error.toString(),
          ),
        );
      },
    );
  }

  /// SUPERVISOR LISTENER
  void startLiveLocationStream() {
  print("🚀 startLiveLocationStream called");
  if (_isStreaming) {
    print("⚠️ already streaming, ignoring");
    return;
  }
    _isStreaming = true;

    _subscription = _liveLocationUseCase
        .streamLiveLocations()
        .listen(
      (locations) {
              print("📡 locations received: ${locations.length}");

        emit(
          LiveLocationSuccessState(locations),
        );
      },
      onError: (error) {
              print("❌ stream error: $error");

        emit(
          LiveLocationErrorState(
            message: error.toString(),
          ),
        );
      },
    );
  }

  void stopLiveLocationStream() {
      print("🛑 stopLiveLocationStream called");

    _subscription?.cancel();
    _subscription = null;

    _isStreaming = false;
     emit(LiveLocationInitialState());
  }

  /// RESEARCHER SHARING
  void startSharingLocation(
    Future<LiveLocationEntity> Function() getLocation,
  ) {
      print("🚀 START sharing location");

    _liveLocationTimer?.cancel();

    _liveLocationTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) async {
              print("📡 sending location update");

        final entity = await getLocation();

        await updateLiveLocation(entity);
      },
    );
  }

  void stopSharingLocation() {
      print("🛑 STOP sharing location CALLED");

    _liveLocationTimer?.cancel();
    _liveLocationTimer = null;
      print("🧹 timer cancelled: ${_liveLocationTimer == null}");

  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _liveLocationTimer?.cancel();

    return super.close();
  }
}