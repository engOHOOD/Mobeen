import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 20),
        backgroundColor: backgroundColor ?? theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), 
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        shadowColor: theme.shadowColor.withAlpha(20),
        elevation: 1,
      ),
      child: Text(
        title,
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor ?? theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
