import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';

abstract class AssignFormState extends Equatable {
  const AssignFormState();

  @override
  List<Object?> get props => [];
}

class AssignFormInitialState extends AssignFormState {}
class AssignFormLoadingState extends AssignFormState {}

class AssignFormSuccessState extends AssignFormState {
  final List<UserEntity> team;
  const AssignFormSuccessState({required this.team});
  @override
  List<Object?> get props => [team];
}
class AssignFormSuccessloadingState extends AssignFormState {}


class AssignFormErrorState extends AssignFormState {
  final String message;
  const AssignFormErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
