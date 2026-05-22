import 'package:equatable/equatable.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object?> get props => [];
}

class LogInInitialState extends LogInState {}

class LogInLoadingState extends LogInState {}

class LogInSuccessState extends LogInState {}

class LogInErrorState extends LogInState {
  final String message;
  const LogInErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
