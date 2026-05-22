import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/features/user_profile/presentation/widgets/custom_row_item.dart';

class CustomInfoCard extends StatelessWidget {
  final String organisation;
  final String phone;
  final String email;

  const CustomInfoCard({
    super.key,
    required this.organisation,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary),
        color: Colors.white,
      ),
      child: Column(
        children: [
          RowItem(title: "الجهة", value: organisation),
          Divider(color: AppColors.primary),
          RowItem(title: "رقم الجوال", value: phone),
          Divider(color: AppColors.primary),
          RowItem(title: "البريد الإلكتروني", value: email),
        ],
      ),
    );
  }
}