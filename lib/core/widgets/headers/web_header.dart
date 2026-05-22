import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/extensions/font_extensions.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:sizer/sizer.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({
    super.key,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  });
  final String title;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.displayMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 3.sizeSW(min: 3.sh, max: 20.sh),
          width: 10.sizeSW(min: 10.sw, max: 30.sw),
          child: CustomButton(title: buttonTitle, onPressed: onPressed),
        ),
      ],
    );
  }
}