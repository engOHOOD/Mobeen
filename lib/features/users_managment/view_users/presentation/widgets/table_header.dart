import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
