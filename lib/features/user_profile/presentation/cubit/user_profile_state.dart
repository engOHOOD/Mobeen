import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object?> get props => [];
}

class UserProfileInitialState extends UserProfileState {}

class UserProfileSuccessState extends UserProfileState {
  final UserEntity user;
  const UserProfileSuccessState({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserProfileErrorState extends UserProfileState {
  final String message;
  const UserProfileErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
