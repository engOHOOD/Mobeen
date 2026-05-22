import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class CustomToggle extends StatelessWidget {
  final dynamic selected;
  final Map<dynamic, String> items;
  final Function(dynamic) onChanged;

  const CustomToggle({
    super.key,
    required this.selected,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: items.entries.map((item) {
          final isSelected = selected == item.key;

          return Expanded(
            child: TextButton(
              onPressed: () => onChanged(item.key),
              child: Text(
                item.value,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textHint,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}