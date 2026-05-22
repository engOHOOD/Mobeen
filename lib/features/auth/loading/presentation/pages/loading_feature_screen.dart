import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/loading_widget.dart';
import 'package:mobeen/features/auth/loading/presentation/cubit/loading_cubit.dart';
import 'package:mobeen/features/auth/loading/presentation/cubit/loading_state.dart';

class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<LoadingCubit>();
    final user = GetIt.I<UserService>();
    return Scaffold(
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          switch (state) {
            case LoadingSuccessState _:
              if (state.isLogin) {
                if (!(user.isMustResetPassword)) {
                  if (user.isSuperAdmin || user.isAdmin) {
                    context.pushReplacement(Routes.adminHome);
                  } else {
                    context.pushReplacement(Routes.homeUser);
                  }
                } else {
                  context.go(Routes.setPassword);
                }
              } else {
                context.go(Routes.logIn);
              }

            case LoadingErrorState _:
              context.showSnackBar(state.message, isError: true);
              context.go(Routes.logIn);
            default:
              context.go(Routes.logIn);
          }
        },
        child: Center(child: LoadingWidget()),
      ),
    );
  }
}
