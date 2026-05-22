import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/extensions/font_extensions.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/utils/validators.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/core/widgets/cards/custom_container_box.dart';
import 'package:mobeen/core/widgets/fields/custom_text_field.dart';
import 'package:mobeen/features/auth/log_in/presentation/cubit/log_in_cubit.dart';
import 'package:mobeen/features/auth/log_in/presentation/cubit/log_in_state.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/features/auth/log_in/presentation/widgets/auth_header.dart';

class LogInFeatureScreen extends HookWidget {
  const LogInFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LogInCubit>();

    final emailController = useTextEditingController(text:"");
    final passwordController = useTextEditingController(text:"");

    final formKey = GlobalKey<FormState>();
    final isobsecure = useState(true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<LogInCubit, LogInState>(
            listener: (context, state) {
              // Always hide loading before handling new state
              context.hideLoading();
              switch (state) {
                // Loading state
                case LogInLoadingState _:
                  context.showLoading();
                // Success state
                case LogInSuccessState _:
                  context.go(Routes.loading);

                // Error state
                case LogInErrorState _:
                  context.showSnackBar(state.message, isError: true);
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(
                      'assets/images/logo_mobeen.png',
                      height: 20.sizeSH(min: 100, max: 200),
                    ),
                    AuthHeader(
                      title: "تسجيل الدخول",
                      subtitle: "ادخل بياناتك للوصول إلى منظومة مبين",
                    ),
                    Gap(20),
                    CustomContainerBox(
                      maxWidth: 25,
                      maxHeight: 40,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: .center,
                          children: [
                            // Email field
                            CustomTextField(
                              title: "البريد الإلكتروني",
                              hintText: "الريد الإلكتروني",
                              controller: emailController,
                              validator: Validators.validateEmail,
                            ),
                            Gap(20),
                            // Password field
                            CustomTextField(
                              title: "كلمة المرور",
                              hintText: "كلمة المرور",
                              controller: passwordController,
                              obscureText: true,
                              isObscured: isobsecure.value,
                              onToggleObscure: () {
                                isobsecure.value = !isobsecure.value;
                              },
                            ),
                            Gap(20),
                            // Login button
                            CustomButton(
                              title: "تسجيل الدخول",
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                cubit.getLogInMethod(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
