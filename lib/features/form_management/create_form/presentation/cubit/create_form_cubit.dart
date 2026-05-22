import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:mobeen/features/form_management/create_form/domain/use_cases/create_form_use_case.dart';
import 'package:mobeen/features/form_management/create_form/presentation/cubit/create_form_state.dart';

class CreateFormCubit extends Cubit<CreateFormState> {
  final CreateFormUseCase _createFormUseCase;

  CreateFormCubit(this._createFormUseCase) : super(const CreateFormInitialState());
  
  final List<AddQuestion> questions = [];

  void addQuestion(AddQuestion question) {
    questions.add(question);
    emit(CreateFormSuccessState(questions: List.from(questions)));
  }

  void updateQuestion() {
    emit(CreateFormSuccessState(questions: List.from(questions)));
  }

  void removeQuestion(int index) {
    if (index >= 0 && index < questions.length) {
      questions.removeAt(index);
      emit(CreateFormSuccessState(questions: List.from(questions)));
    }
  }

  Future<void> createForm({
    required String title,
    required String description,
    required int target
  }) async {
    emit(CreateFormLoadingState(questions: List.from(questions)));
    
    final result = await _createFormUseCase.createForm(
      title: title,
      description: description,
      questions: questions,
      target:target
    );

    result.when(
      (success) {
        questions.clear();
        emit(const CreateFormSubmittedSuccessfullyState(questions: []));
      },
      (error) {
        emit(CreateFormErrorState(
          questions: List.from(questions), 
          message: error.message,
        ));
      },
    );
  }
}