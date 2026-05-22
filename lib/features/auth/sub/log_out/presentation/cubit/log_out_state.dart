import 'package:equatable/equatable.dart';

abstract class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object?> get props => [];
}

class LogOutInitialState extends LogOutState {}
class LogOutSuccessState extends LogOutState {}

class LogOutErrorState extends LogOutState {
  final String message;
  const LogOutErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

