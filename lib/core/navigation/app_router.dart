import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/navigation/navigation_component/admin/admin_sidebar.dart';
import 'package:mobeen/core/navigation/navigation_component/main_bottom_navigation.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/auth/log_in/presentation/cubit/log_in_cubit.dart';
import 'package:mobeen/features/auth/log_in/presentation/pages/log_in_feature_screen.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/cubit/assign_form_cubit.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/pages/assign_form_feature_screen.dart';
import 'package:mobeen/features/form_management/view_form/presentation/cubit/view_form_cubit.dart';
import 'package:mobeen/features/form_management/view_form/presentation/pages/view_form_feature_screen.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_cubit.dart';
import 'package:mobeen/features/live_team/presentation/pages/live_team_feature_screen.dart';
import 'package:mobeen/features/team/domain/use_cases/team_use_case.dart';
import 'package:mobeen/features/user_profile/domain/use_cases/user_profile_use_case.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeen/features/users_managment/create_user/presentation/pages/create_user_feature_screen.dart';
import 'package:mobeen/features/users_managment/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:mobeen/features/organizations_managment/create_organization/presentation/pages/create_organization_feature_screen.dart';
import 'package:mobeen/features/organizations_managment/create_organization/presentation/cubit/create_organization_cubit.dart';
import 'package:mobeen/features/auth/set_password/presentation/pages/set_password_feature_screen.dart';
import 'package:mobeen/features/auth/set_password/presentation/cubit/set_password_cubit.dart';
import 'package:mobeen/features/home/admin_home/presentation/pages/admin_home_feature_screen.dart';
import 'package:mobeen/features/home/admin_home/presentation/cubit/admin_home_cubit.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/pages/view_users_feature_screen.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/cubit/view_users_cubit.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';
import 'package:mobeen/features/location_management/location/presentation/pages/location_details_screen.dart';
import 'package:mobeen/features/translate/presentation/pages/translate_feature_screen.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_cubit.dart';
import 'package:mobeen/features/location_management/location/presentation/pages/location_feature_screen.dart';
import 'package:mobeen/features/location_management/location/presentation/cubit/location_cubit.dart';
import 'package:mobeen/features/user_profile/presentation/pages/user_profile_feature_screen.dart';
import 'package:mobeen/features/user_profile/presentation/cubit/user_profile_cubit.dart';
import 'package:mobeen/features/team/presentation/cubit/team_cubit.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/pages/view_organization_feature_screen.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/cubit/view_organization_cubit.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/pages/view_forms_feature_screen.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/cubit/view_forms_cubit.dart';
import 'package:mobeen/features/form_management/create_form/presentation/pages/create_form_feature_screen.dart';
import 'package:mobeen/features/form_management/create_form/presentation/cubit/create_form_cubit.dart';
import 'package:mobeen/features/form_management/export_data/presentation/pages/export_data_feature_screen.dart';
import 'package:mobeen/features/form_management/export_data/presentation/cubit/export_data_cubit.dart';
import 'package:mobeen/features/home/user_home/presentation/pages/user_home_feature_screen.dart';
import 'package:mobeen/features/home/user_home/presentation/cubit/user_home_cubit.dart';
import 'package:mobeen/features/form_management/fill_form/presentation/pages/fill_form_feature_screen.dart';
import 'package:mobeen/features/form_management/fill_form/presentation/cubit/fill_form_cubit.dart';
import 'package:mobeen/features/auth/loading/presentation/pages/loading_feature_screen.dart';
import 'package:mobeen/features/auth/loading/presentation/cubit/loading_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.logIn,

    routes: [
      GoRoute(
        path: Routes.logIn,
        builder: (context, state) => BlocProvider(
          create: (context) => LogInCubit(GetIt.I.get()),
          child: const LogInFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.setPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => SetPasswordCubit(GetIt.I.get()),
          child: const SetPasswordFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.loading,
        builder: (context, state) => BlocProvider(
          create: (context) => LoadingCubit(GetIt.I.get()),
          child: const LoadingFeatureScreen(),
        ),
      ),

      //===============================================================================
      //                                Admin
      //===============================================================================
      ShellRoute(
        builder: (context, state, child) => AdminSidebar(child: child),

        routes: [
          GoRoute(
            path: Routes.adminHome,
            builder: (context, state) => BlocProvider(
              create: (context) => AdminHomeCubit(GetIt.I.get()),
              child: const AdminHomeFeatureScreen(),
            ),
          ),
          GoRoute(
            path: Routes.viewUsers,
            builder: (context, state) => BlocProvider(
              create: (context) => ViewUsersCubit(GetIt.I.get()),
              child: const ViewUsersFeatureScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.createUser,
                builder: (context, state) => BlocProvider(
                  create: (context) => CreateUserCubit(GetIt.I.get()),
                  child: const CreateUserFeatureScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: Routes.viewOrganization,
            builder: (context, state) => BlocProvider(
              create: (context) => ViewOrganizationCubit(GetIt.I.get()),
              child: const ViewOrganizationFeatureScreen(),
            ),
          ),
          GoRoute(
            path: Routes.createOrganization,
            builder: (context, state) => BlocProvider(
              create: (context) => CreateOrganizationCubit(GetIt.I.get()),
              child: const CreateOrganizationFeatureScreen(),
            ),
          ),
          GoRoute(
            path: Routes.adminProfile,
            builder: (context, state) => BlocProvider(
              create: (context) => UserProfileCubit(GetIt.I.get()),
              child: const UserProfileFeatureScreen(),
            ),
          ),
        ],
      ),
      //===============================================================================
      //                                User
      //===============================================================================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainBottomNavigation(navigationShell: navigationShell);
        },

        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.homeUser,
                builder: (context, state) => BlocProvider(
                  create: (context) => UserHomeCubit(GetIt.I.get()),
                  child: const UserHomeFeatureScreen(),
                ),
                routes: [],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.secondTab,

                builder: (context, state) {
                  return BlocProvider(
                    create: (context) => ViewFormsCubit(GetIt.I.get()),
                    child: const ViewFormsFeatureScreen(),
                  );
                },

                routes: [
                  GoRoute(
                    path: Routes.viewForm,
                    builder: (context, state) {
                      final form = state.extra as FormEntity;
                      return BlocProvider(
                        create: (context) => ViewFormCubit(GetIt.I.get()),
                        child: ViewFormFeatureScreen(formEntity: form),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: Routes.assignForm,
                        builder: (context, state) {
                          final form = state.extra as FormEntity;
                          return BlocProvider(
                            create: (context) => AssignFormCubit(GetIt.I.get()),
                            child: AssignFormFeatureScreen(form: form),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.createForm,
                    builder: (context, state) => BlocProvider(
                      create: (context) => CreateFormCubit(GetIt.I.get()),
                      child: CreateFormFeatureScreen(),
                    ),
                  ),
                  GoRoute(
                    path: Routes.fillForm,
                    builder: (context, state) {
                      final formId = state.extra as String;
                      return BlocProvider(
                        create: (context) => FillFormCubit(GetIt.I.get()),
                        child: FillFormFeatureScreen(formId: formId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.thirdTab,

                builder: (context, state) {
                  final role = GetIt.I<UserService>().getUser!.role;

                  if (role == 'supervisor') {
                    return BlocProvider(
                      create: (_) => LocationCubit(GetIt.I.get()),
                      child: const LocationFeatureScreen(),
                    );
                  }

                  if (role == 'researcher') {
                    return BlocProvider(
                      create: (context) => TranslateCubit(GetIt.I.get()),
                      child: const TranslateFeatureScreen(),
                    );
                  }
                  return BlocProvider(
                    create: (_) => ExportDataCubit(GetIt.I.get()),
                    child: const ExportDataFeatureScreen(),
                  );
                },

                routes: [
                  GoRoute(
                    path: Routes.locationDetails,

                    builder: (context, state) {
                      final location = state.extra as LocationEntity;
                      return LocationDetailsPage(location: location);
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.team,
                builder: (context, state) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (_) => TeamCubit(GetIt.I.get<TeamUseCase>()),
                    ),
                    BlocProvider.value(value: GetIt.I<LiveLocationCubit>()),
                  ],
                  child: const LiveTeamFeatureScreen(),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.userProfile,
                builder: (_, __) {
                  final role = GetIt.I<UserService>().getUser!.role;

                  if (role == 'researcher') {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => UserProfileCubit(
                            GetIt.I.get<UserProfileUseCase>(),
                          ),
                        ),
                        BlocProvider.value(value: GetIt.I<LiveLocationCubit>()),
                      ],
                      child: const UserProfileFeatureScreen(),
                    );
                  }
                  return BlocProvider(
                    create: (context) => UserProfileCubit(GetIt.I.get()),
                    child: const UserProfileFeatureScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
