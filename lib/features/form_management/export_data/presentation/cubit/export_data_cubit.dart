import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/features/form_management/export_data/domain/use_cases/export_data_use_case.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_state.dart';

class ExportDataCubit extends Cubit<ExportDataState> {
  final ExportDataUseCase _exportDataUseCase;

  ExportDataCubit(this._exportDataUseCase) : super(ExportDataInitialState());

  String? selectedFormId;
  List<FormEntity> forms = [];
  DateTime? fromDate;
  DateTime? toDate;

  bool isSelected(String id) => selectedFormId == id;

  Future<void> getExportDataMethod() async {
    emit(ExportDataLoadingState());

    final result = await _exportDataUseCase.getExportData();

    result.when(
      (success) {
        forms = success;
        emit(ExportDataSuccessState(forms: success));
      },
      (error) {
        emit(ExportDataErrorState(message: error.message));
      },
    );
  }

  void selectForm(String? id) {
    if (selectedFormId == id) {
      selectedFormId = null; 
    } else {
      selectedFormId = id; 
    }
    emit(ExportDataSelectionUpdatedState());
  }

  void setFromDate(DateTime date) {
    fromDate = date;
    emit(ExportDataDateUpdatedState());
  }

  void setToDate(DateTime date) {
    toDate = date;
    emit(ExportDataDateUpdatedState());
  }

  Future<void> exportSelectedForms() async {
    if (selectedFormId == null) return;

    if (fromDate == null || toDate == null) {
      emit(const ExportDataErrorState(message: 'اختر التاريخ اولاً'));
      return;
    }

    emit(ExportDataLoadingState());

    final result = await _exportDataUseCase.exportSelectedForms(
      forms: [selectedFormId!],
      fromDate: fromDate!,
      toDate: toDate!,
    );

    result.when(
      (_) {
        selectedFormId = null;
        emit(ExportDataExportSuccessState());
        emit(ExportDataSuccessState(forms: forms));
      },
      (error) {
        emit(ExportDataErrorState(message: error.message));
      },
    );
  }

  @override
  Future<void> close() {
    selectedFormId = null;
    forms.clear();
    return super.close();
  }
}