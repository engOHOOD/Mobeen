import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';

abstract class ExportDataState extends Equatable {
  const ExportDataState();

  @override
  List<Object?> get props => [];
}

class ExportDataInitialState extends ExportDataState {}

class ExportDataLoadingState extends ExportDataState {}

class ExportDataSuccessState extends ExportDataState {
  final List<FormEntity> forms;
  const ExportDataSuccessState({required this.forms});

  @override
  List<Object?> get props => [forms];
}

class ExportDataSelectionUpdatedState extends ExportDataState {}

class ExportDataDateUpdatedState extends ExportDataState {}

class ExportDataExportSuccessState extends ExportDataState {}

class ExportDataErrorState extends ExportDataState {
  final String message;
  const ExportDataErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}