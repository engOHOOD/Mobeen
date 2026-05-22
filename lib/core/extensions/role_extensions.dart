import 'package:mobeen/core/constants/app_enums.dart';

extension UserRoleMapper on UserRole {
  String get value {
    switch (this) {
      case UserRole.supervisor:
        return 'supervisor';

      case UserRole.researcher:
        return 'researcher';

      case UserRole.superAdmin:
        return 'super_admin';

      case UserRole.dataAnalyst:
        return 'data_analyst';
    }
  }
}
