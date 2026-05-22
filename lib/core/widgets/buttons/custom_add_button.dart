import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String? title;

  const CustomAddButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(25),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: AppColors.greenSecondary,
                width: 1.2,
              ),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 28,
            ),
          ),

          if (title != null) ...[
            const SizedBox(height: 6),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}