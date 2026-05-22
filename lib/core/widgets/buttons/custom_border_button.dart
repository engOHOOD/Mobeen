import 'package:flutter/material.dart';

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: theme.colorScheme.primary,
          ),
        ),
        shadowColor: theme.shadowColor.withAlpha(100),
        elevation: 8,
      ),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
      ),
    );
  }
}