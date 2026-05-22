import 'package:equatable/equatable.dart';
import 'package:mobeen/features/organizations_managment/view_organization/domain/entities/view_organization_entity.dart';

abstract class ViewOrganizationState extends Equatable {
  const ViewOrganizationState();

  @override
  List<Object?> get props => [];
}

class ViewOrganizationInitialState extends ViewOrganizationState {}

class ViewOrganizationSuccessState extends ViewOrganizationState {
  final List<ViewOrganizationEntity> organizations;
  const ViewOrganizationSuccessState({required this.organizations});
  @override
  List<Object?> get props => [organizations];
}

class ViewOrganizationErrorState extends ViewOrganizationState {
  final String message;
  const ViewOrganizationErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
