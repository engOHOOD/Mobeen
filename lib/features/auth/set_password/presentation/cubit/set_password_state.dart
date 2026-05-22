import 'package:equatable/equatable.dart';

abstract class SetPasswordState extends Equatable {
  const SetPasswordState();

  @override
  List<Object?> get props => [];
}

class SetPasswordInitialState extends SetPasswordState {}
class SetPasswordLoadingState extends SetPasswordState {}

class SetPasswordSuccessState extends SetPasswordState {}

class SetPasswordErrorState extends SetPasswordState {
  final String message;
  const SetPasswordErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

