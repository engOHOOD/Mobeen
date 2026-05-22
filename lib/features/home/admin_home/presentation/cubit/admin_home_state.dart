import 'package:equatable/equatable.dart';

abstract class AdminHomeState extends Equatable {
  const AdminHomeState();

  @override
  List<Object?> get props => [];
}

class AdminHomeInitialState extends AdminHomeState {}
class AdminHomeSuccessState extends AdminHomeState {}

class AdminHomeErrorState extends AdminHomeState {
  final String message;
  const AdminHomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

