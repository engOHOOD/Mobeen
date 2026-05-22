import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';

abstract class ViewFormsState extends Equatable {
  const ViewFormsState();

  @override
  List<Object?> get props => [];
}

class ViewFormsInitialState extends ViewFormsState {}
class ViewFormsLoadingState extends ViewFormsState {}

class ViewFormsSuccessState extends ViewFormsState {
  final List<FormEntity> forms;
  const ViewFormsSuccessState({required this.forms});
  @override
  List<Object?> get props => [forms];
}

class ViewFormsErrorState extends ViewFormsState {
  final String message;
  const ViewFormsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
