import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class RowItem extends StatelessWidget {
  const RowItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(value, style: TextStyle(color: AppColors.greenPrimary)),
        ],
      ),
    );
  }
}
