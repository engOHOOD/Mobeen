import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:progress_indicator_plus/linear_progress_indicator_plus.dart';
import 'package:sizer/sizer.dart';

class ListFormsWidget extends StatelessWidget {
  final String title;
  final bool status;
  final int progress;
  final int target;

  const ListFormsWidget({
    super.key,
    required this.title,
    required this.status,
    required this.progress,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      margin: .symmetric(horizontal: 8, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: status ? AppColors.greenSecondary : AppColors.redSecondary,
          width: 0.5,
        ),
        borderRadius: .circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withAlpha(5),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(title),
              Container(
                padding: .symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: .circular(20),
                  color: status ? AppColors.greenLight : AppColors.redLight,
                ),
                child: Text(
                  status ? 'مفعل' : 'غير مفعل',
                  
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: status ? AppColors.greenPrimary : AppColors.redDark
                  )
                ),
              ),
            ],
          ),
          Gap(12),
          Row(
            children: [
              Flexible(
                child: LinearProgressIndicatorPlus(
                  value: 20 / 100,
                  text: '',
                  height: 2.sh,
                  padding: 8,
                  backgroundColor: AppColors.textTertiary,
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Gap(10),
              Text(
                '$target/$progress',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
