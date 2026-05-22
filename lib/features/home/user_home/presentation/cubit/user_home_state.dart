import 'package:equatable/equatable.dart';

abstract class UserHomeState extends Equatable {
  const UserHomeState();

  @override
  List<Object?> get props => [];
}

class UserHomeInitialState extends UserHomeState {}
class UserHomeSuccessState extends UserHomeState {}

class UserHomeErrorState extends UserHomeState {
  final String message;
  const UserHomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

