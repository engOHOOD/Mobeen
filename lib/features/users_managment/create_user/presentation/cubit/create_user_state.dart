import 'package:equatable/equatable.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object?> get props => [];
}

class CreateUserInitialState extends CreateUserState {}
class CreateUserLoadingState extends CreateUserState {}

class CreateUserSuccessState extends CreateUserState {}

class CreateUserErrorState extends CreateUserState {
  final String message;
  const CreateUserErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

