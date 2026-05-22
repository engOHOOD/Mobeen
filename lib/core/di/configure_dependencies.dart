import 'package:get_it/get_it.dart';
import 'package:mobeen/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/features/location_management/live_location/di/live_location_di.dart';
import 'package:mobeen/features/form_management/fill_form/di/fill_form_di.dart';
import 'package:mobeen/features/users_managment/create_user/di/create_user_di.dart';
import 'package:mobeen/features/organizations_managment/create_organization/di/create_organization_di.dart';
import 'package:mobeen/features/auth/log_in/di/log_in_di.dart';
import 'package:mobeen/features/auth/set_password/di/set_password_di.dart';
import 'package:mobeen/features/home/admin_home/di/admin_home_di.dart';
import 'package:mobeen/features/users_managment/view_users/di/view_users_di.dart';
import 'package:mobeen/features/translate/di/translate_di.dart';
import 'package:mobeen/features/location_management/location/di/location_di.dart';
import 'package:mobeen/features/tasks/di/tasks_di.dart';
import 'package:mobeen/features/user_profile/di/user_profile_di.dart';
import 'package:mobeen/features/auth/sub/log_out/di/log_out_di.dart';
import 'package:mobeen/features/team/di/team_di.dart';
import 'package:mobeen/features/organizations_managment/view_organization/di/view_organization_di.dart';
import 'package:mobeen/features/form_management/view_forms/di/view_forms_di.dart';
import 'package:mobeen/features/form_management/create_form/di/create_form_di.dart';
import 'package:mobeen/features/form_management/export_data/di/export_data_di.dart';
import 'package:mobeen/features/home/user_home/di/user_home_di.dart';
import 'package:mobeen/features/form_management/view_form/di/view_form_di.dart';
import 'package:mobeen/features/form_management/assign_form/di/assign_form_di.dart';
import 'package:mobeen/features/auth/loading/di/loading_di.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib/core'],
)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
  configureCreateUser(getIt);
  configureCreateOrganization(getIt);
  configureLogIn(getIt);
  configureSetPassword(getIt);
  configureAdminHome(getIt);
  configureViewUsers(getIt);
  configureTranslate(getIt);
  configureLocation(getIt);
  configureTasks(getIt);
  configureUserProfile(getIt);
  configureLogOutSub(getIt);
  configureTeam(getIt);
  configureViewOrganization(getIt);
  configureCreateForm(getIt);
  configureViewForms(getIt);
  configureExportData(getIt);
  configureUserHome(getIt);
  configureLiveLocation(getIt);
  configureViewForm(getIt);
  configureFillForm(getIt);
  configureAssignForm(getIt);
  configureLoading(getIt);
}
