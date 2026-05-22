import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_cubit.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_state.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/widgets/list_forms_widget.dart';

class ExportFormsList extends StatelessWidget {
  final List forms;
  final ExportDataCubit cubit;

  const ExportFormsList({
    super.key,
    required this.forms,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportDataCubit, ExportDataState>(
      buildWhen: (previous, current) =>
          current is ExportDataSelectionUpdatedState,
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: forms.length,
          itemBuilder: (context, index) {
            final form = forms[index];

            final isSelected = cubit.selectedFormId == form.id;

            return GestureDetector(
              onTap: () {
                cubit.selectForm(form.id);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.primary.withAlpha(40),
                    width: isSelected ? 2 : 1,
                  ),
                  color: isSelected
                      ? AppColors.primary.withAlpha(20)
                      : Colors.white,
                ),
                child: ListFormsWidget(
                  progress: form.achieved,
                  target: form.target,
                  title: form.title,
                  status: form.isEnabled,
                ),
              ),
            );
          },
        );
      },
    );
  }
}