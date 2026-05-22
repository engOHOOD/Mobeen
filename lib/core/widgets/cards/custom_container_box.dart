import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/extensions/font_extensions.dart';

class CustomContainerBox extends StatelessWidget {
  const CustomContainerBox({
    super.key,
    this.child,
    required this.maxWidth,
    required this.maxHeight,
  });
  final Widget? child;
  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: maxWidth.sizeSW(min: 600, max: 980),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary),
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withAlpha(40),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
