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
    return Container(
      margin: .all(5),

      child: ListTile(
        minVerticalPadding: 10,
        contentPadding: .all(10),
        title: Text(title),
        subtitle: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Flexible(
              child: LinearProgressIndicatorPlus(
                value: 5 / 100,
                text: '',
                height: 2.sh,
                padding: 8,
                backgroundColor: Colors.grey[300],
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Gap(10),
            Text('$target/$progress'),
          ],
        ),
        trailing: Container(
          padding: .all(5),
          margin: .all(15),
          decoration: BoxDecoration(
            borderRadius: .circular(20),
            color: status
                ? AppColors.success.withAlpha(100)
                : AppColors.error.withAlpha(100),
          ),
          child: Text(status ? 'مفعل' : 'غير مفعل'),
        ),
      ),
    );
  }
}
