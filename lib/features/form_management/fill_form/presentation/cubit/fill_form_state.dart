import 'package:equatable/equatable.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/generate_form_entity.dart';

abstract class FillFormState extends Equatable {
  const FillFormState();

  @override
  List<Object?> get props => [];
}

class FillFormInitialState extends FillFormState {}

class FillFormLoadingState extends FillFormState {}

class FillFormSubmitState extends FillFormState {}

class FillFormSuccessState extends FillFormState {
  final GenerateFormEntity generateForm;
  // 1. ADD THIS: Hold the current answers map in the state snapshot
  final Map<String, dynamic> answers; 

  // 2. UPDATE THIS: Add it to the constructor
  const FillFormSuccessState({
    required this.generateForm, 
    required this.answers,
  });

  // 3. UPDATE THIS: Add answers to Equatable's props comparison list
  @override
  List<Object?> get props => [generateForm, answers]; 
}

class FillFormErrorState extends FillFormState {
  final String message;
  const FillFormErrorState({required this.message});
  
  @override
  List<Object?> get props => [message];
}