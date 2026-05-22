import 'package:flutter/material.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/constants/app_colors.dart';

DataRow buildDataRow(int index, List<UserEntity> users) {
  final user = users[index];

  return DataRow(
      color: WidgetStatePropertyAll(
      user.mustResetPassword ? AppColors.rowActive : Colors.transparent,
    ),
    cells: [
      DataCell(Text(user.name)),
      DataCell(Text(user.email)),
      DataCell(Text(user.role)),
      DataCell(
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: user.mustResetPassword,
            onChanged: (val) {},
            activeThumbColor: AppColors.primary,
          ),
        ),
      ),
    ],
  );
}