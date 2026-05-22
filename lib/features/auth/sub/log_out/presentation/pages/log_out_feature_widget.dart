import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/features/auth/sub/log_out/presentation/cubit/log_out_cubit.dart';
import 'package:mobeen/features/auth/sub/log_out/presentation/cubit/log_out_state.dart';

class LogOutFeatureWidget extends StatelessWidget {
  const LogOutFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(GetIt.I.get()),
      child: BlocListener<LogOutCubit, LogOutState>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            context.go(Routes.logIn);
          } else if (state is LogOutErrorState) {
            context.showSnackBar("حدث خطأ أثناء تسجيل الخروج", isError: true);
          }
        },
        child: Builder(
          builder: (context) {
            return CustomButton(
              borderColor: AppColors.redSecondary,
              textColor: AppColors.redDark,
              backgroundColor: AppColors.redLight,
              title: "تسجيل الخروج",
              onPressed: () => context.showConfirmDialog(
                title: "تسجيل الخروج",
                message: "هل أنت متأكد من رغبتك في تسجيل الخروج؟",
                onConfirm: () {
                  context.read<LogOutCubit>().getLogOutMethod();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
