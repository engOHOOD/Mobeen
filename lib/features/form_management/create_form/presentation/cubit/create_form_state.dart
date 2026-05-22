import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/add_question.dart';

abstract class CreateFormState extends Equatable {
  final List<AddQuestion> questions;

  const CreateFormState({this.questions = const []});

  @override
  List<Object?> get props => [questions];
}

class CreateFormInitialState extends CreateFormState {
  const CreateFormInitialState() : super(questions: const []);
}

class CreateFormLoadingState extends CreateFormState {
  const CreateFormLoadingState({required super.questions});
}

class CreateFormSuccessState extends CreateFormState {
  const CreateFormSuccessState({required super.questions});
}

class CreateFormSubmittedSuccessfullyState extends CreateFormState {
  const CreateFormSubmittedSuccessfullyState({required super.questions});
}

class CreateFormErrorState extends CreateFormState {
  final String message;

  const CreateFormErrorState({required super.questions, required this.message});

  @override
  List<Object?> get props => [questions, message];
}