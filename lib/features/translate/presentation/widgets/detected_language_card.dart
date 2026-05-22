import 'package:flutter/material.dart';

class DetectedLanguageCard extends StatelessWidget {
  const DetectedLanguageCard({
    super.key,
    required this.language,
    required this.onReset,
  });

  final String language;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Column(
      children: [
            Align(
              alignment: .centerLeft,
              child: TextButton(
                  onPressed: onReset,
                  child: Text(
                    "جلسة جديدة",
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(15),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تم اكتشاف: $language',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          ),
        ),
     
      ],
    );
  }
}
