import 'package:equatable/equatable.dart';
import 'package:mobeen/features/translate/domain/entities/translate_entity.dart';

abstract class TranslateState extends Equatable {
  const TranslateState();

  @override
  List<Object?> get props => [];
}

class TranslateInitialState extends TranslateState {}

class TranslateLoadingState extends TranslateState {}

class TranslateRecordingState extends TranslateState {
  final bool start;

  const TranslateRecordingState({required this.start});

  @override
  List<Object?> get props => [start];
}

class TranslateSuccessState extends TranslateState {
  final TranslateEntity result;

  const TranslateSuccessState({required this.result});

  @override
  List<Object?> get props => [result];
}

class TranslateErrorState extends TranslateState {
  final String message;
  const TranslateErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
