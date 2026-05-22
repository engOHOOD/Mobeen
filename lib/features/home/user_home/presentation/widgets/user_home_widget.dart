import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class CustomAppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: AppColors.primary,
            ),
          ),
             Image.asset(
             'assets/images/logo_mobeen.png',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ],
      ),
           bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.border,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}