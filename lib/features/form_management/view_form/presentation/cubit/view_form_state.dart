import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/question_entity.dart';

abstract class ViewFormState extends Equatable {
  const ViewFormState();

  @override
  List<Object?> get props => [];
}

class ViewFormInitialState extends ViewFormState {}

class ViewFormSuccessState extends ViewFormState {
  final List<QuestionEntity> questions;
  const ViewFormSuccessState({required this.questions});
  @override
  List<Object?> get props => [questions];
}

class ViewFormErrorState extends ViewFormState {
  final String message;
  const ViewFormErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
