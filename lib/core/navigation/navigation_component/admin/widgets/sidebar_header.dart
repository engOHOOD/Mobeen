import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/extensions/font_extensions.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo_mobeen.png',
            height: 20.sizeSH(min: 100, max: 200),
          ),
          Gap(15),
          Text(
            "مبين | صوت الحاج",
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}