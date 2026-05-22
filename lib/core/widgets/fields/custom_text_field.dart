import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.isObscured = false,
    this.onToggleObscure,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isObscured;
  final VoidCallback? onToggleObscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.labelMedium),
        const Gap(5),
        TextFormField(
          cursorColor: theme.colorScheme.onPrimary,
          style: theme.textTheme.bodySmall,
          controller: controller,
          obscureText: isObscured,
          validator: validator,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16, color: AppColors.textHint),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: onToggleObscure,
                    icon: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.primary),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onSurface.withAlpha(100),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: theme.colorScheme.surface.withAlpha(100),
          ),
        ),
      ],
    );
  }
}
