import 'package:flutter/material.dart';

class TranslateResultCard extends StatelessWidget {
  final bool isLoading;
  final String text;

  const TranslateResultCard({
    super.key,
    required this.isLoading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text.isEmpty ? "..." : text,
                textAlign: TextAlign.right,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
      ),
    );
  }
}