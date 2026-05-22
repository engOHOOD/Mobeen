import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_cubit.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_state.dart';

class ExportActionButton extends StatelessWidget {
  final ExportDataCubit cubit;

  const ExportActionButton({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportDataCubit, ExportDataState>(
      builder: (context, state) {
        final hasSelection = cubit.selectedFormId != null;

        return CustomButton(
          title: 'تصدير بصيغة Excel',
          onPressed: hasSelection
              ? cubit.exportSelectedForms
              : () {
                  context.showSnackBar(
                    'الرجاء اختيار نموذج واحد للتصدير أولاً',
                  );
                },
        );
      },
    );
  }
}