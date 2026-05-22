import 'package:equatable/equatable.dart';

abstract class CreateOrganizationState extends Equatable {
  const CreateOrganizationState();

  @override
  List<Object?> get props => [];
}

class CreateOrganizationInitialState extends CreateOrganizationState {}

class CreateOrganizationLoadingState extends CreateOrganizationState {}

class CreateOrganizationSuccessState extends CreateOrganizationState {}

class CreateOrganizationErrorState extends CreateOrganizationState {
  final String message;
  const CreateOrganizationErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
