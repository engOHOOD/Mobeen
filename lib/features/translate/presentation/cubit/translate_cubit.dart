import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/translate/domain/use_cases/translate_use_case.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  final TranslateUseCase _translateUseCase;

  TranslateCubit(this._translateUseCase) : super(TranslateInitialState());

  Future<void> startRecording() async {
    print("Cubit startRecording called");
    emit(TranslateLoadingState());

    final result = await _translateUseCase.startRecording();
    print("UseCase startRecording returned");

    result.when(
      (success) {
        emit(TranslateRecordingState(start: true));
      },
      (whenError) {
        emit(TranslateErrorState(message: whenError.message));
      },
    );
  }

  Future<void> stopRecording() async {
    print("Cubit stopRecording called");
    emit(TranslateLoadingState());
    final result = await _translateUseCase.stopRecording();
    print("UseCase stopRecording returned");

    result.when(
      (success) {
        print(success);
        emit(TranslateSuccessState(result: success));
      },
      (whenError) {
        print(whenError.message);
        emit(TranslateErrorState(message: whenError.message));
      },
    );
  }

  Future<void> sendText(String text) async {
    print("Cubit sendText called");
    emit(TranslateLoadingState());

    final result = await _translateUseCase.sendText(text);
    print("UseCase sendText returned");

    result.when(
      (success) {
        emit(TranslateSuccessState(result: success));
      },
      (whenError) {
        emit(TranslateErrorState(message: whenError.message));
      },
    );
  }

  Future<void> resetSession() async {
    print("Cubit resetSession called");

    emit(TranslateLoadingState());

    final result = await _translateUseCase.resetSession();
    print("UseCase resetSession returned");

    result.when(
      (success) {
        emit(TranslateInitialState());
      },
      (whenError) {
        emit(TranslateErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
