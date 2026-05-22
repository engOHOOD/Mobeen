import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/fill_form_entity.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/generate_form_entity.dart';
import 'package:mobeen/features/form_management/fill_form/domain/use_cases/fill_form_use_case.dart';
import 'package:mobeen/features/form_management/fill_form/presentation/cubit/fill_form_state.dart';

class FillFormCubit extends Cubit<FillFormState> {
  final FillFormUseCase _fillFormUseCase;
  
  final Map<String, dynamic> _answers = {};
  GenerateFormEntity? currentForm;
  final userID = GetIt.I<UserService>().getUser!.id;

  FillFormCubit(this._fillFormUseCase) : super(FillFormInitialState());

  Future<void> getForm({required String formId}) async {
    emit(FillFormInitialState());

    final result = await _fillFormUseCase.getForm(formId: formId);

    result.when(
      (success) {
        currentForm = success;
        emit(FillFormSuccessState(
          generateForm: success,
          answers: Map.from(_answers),
        ));
      },
      (error) {
        emit(FillFormErrorState(message: error.message));
      },
    );
  }

  void updateAnswer({
    required String formId,
    required String questionId,
    required dynamic value,
  }) {
    _answers[questionId] = value;

    if (currentForm != null) {
          emit(FillFormSuccessState(
        generateForm: currentForm!,
        answers: Map.from(_answers),
      ));
    }
  }

  dynamic getSelectedAnswer(String questionId) {
    return _answers[questionId];
  }

  Future<void> submit() async {
    emit(FillFormLoadingState());

    final List<FillFormEntity> submitAnswers = _answers.entries.map((e) {
      final dynamic formattedValue = e.value is List ? e.value : [e.value];

      return FillFormEntity(
        id: UniqueKey().toString(),
        formId: currentForm!.form.id,
        questionId: e.key,
        userId: userID,
        answer: List<dynamic>.from(formattedValue),
      );
    }).toList();

    final result = await _fillFormUseCase.submit(
      submitAnswers: submitAnswers,
    );

    result.when(
      (success) {
        emit(FillFormSubmitState());
      },
      (error) {
        emit(FillFormErrorState(message: error.message));
      },
    );
  }

  @override
  Future<void> close() async {
    _answers.clear();
    currentForm = null;
    return super.close();
  }
}