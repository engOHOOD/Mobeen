import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/navigation/navigation_component/admin/widgets/sidebar_header.dart';
import 'package:mobeen/core/navigation/navigation_component/admin/widgets/sidebar_nav_item.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/buttons/custom_border_button.dart';

class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final theme = Theme.of(context);
    final String? role = GetIt.I<UserService>().getUser?.role;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 260,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(left: BorderSide(color: AppColors.secondary)),
            ),
            child: Column(
              children: [
                Gap(40),
                SidebarHeader(),
                Gap(30),
                Container(
                  alignment: .centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    "القائمة",
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Gap(15),
                SidebarNavItem(
                  title: 'الرئيسية',
                  isActive: location == Routes.adminHome,
                  onTap: () => context.go(Routes.adminHome),
                ),
                if (role == 'super_admin')
                  SidebarNavItem(
                    title: 'الشركات',
                    isActive: location == Routes.viewOrganization,
                    onTap: () => context.go(Routes.viewOrganization),
                  ),
                SidebarNavItem(
                  title: 'المستخدمين',
                  isActive: location == Routes.viewUsers,
                  onTap: () => context.go(Routes.viewUsers),
                ),
                Spacer(),
                CustomBorderButton(
                  title: "الملف الشخصي",
                  onPressed: () {
                    context.go(Routes.adminProfile);
                  },
                ),
                Gap(40),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}