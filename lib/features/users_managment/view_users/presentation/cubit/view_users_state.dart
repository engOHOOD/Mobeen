import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';

abstract class ViewUsersState extends Equatable {
  const ViewUsersState();

  @override
  List<Object?> get props => [];
}

class ViewUsersInitialState extends ViewUsersState {}

class ViewUsersSuccessState extends ViewUsersState {
  final List<UserEntity> users;

  const ViewUsersSuccessState({required this.users});
}

class ViewUsersErrorState extends ViewUsersState {
  final String message;
  const ViewUsersErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
