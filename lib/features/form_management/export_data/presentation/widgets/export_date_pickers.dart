import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_cubit.dart';

class ExportDatePickers extends StatelessWidget {
  final ExportDataCubit cubit;

  const ExportDatePickers({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: cubit.fromDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (date != null) cubit.setFromDate(date);
            },
            icon: const Icon(Icons.date_range, size: 18),
            label: Text(
              cubit.fromDate == null
                  ? "من تاريخ"
                  : cubit.fromDate!.toString().split(' ')[0],
            ),
          ),
        ),
        const Gap(12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: cubit.toDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (date != null) cubit.setToDate(date);
            },
            icon: const Icon(Icons.date_range, size: 18),
            label: Text(
              cubit.toDate == null
                  ? "إلى تاريخ"
                  : cubit.toDate!.toString().split(' ')[0],
            ),
          ),
        ),
      ],
    );
  }
}