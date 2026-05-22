import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/utils/validators.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/core/widgets/cards/custom_container_box.dart';
import 'package:mobeen/core/widgets/fields/custom_text_field.dart';
import 'package:mobeen/features/auth/log_in/presentation/widgets/auth_header.dart';
import 'package:mobeen/features/auth/set_password/presentation/cubit/set_password_cubit.dart';
import 'package:mobeen/features/auth/set_password/presentation/cubit/set_password_state.dart';

class SetPasswordFeatureScreen extends HookWidget {
  const SetPasswordFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SetPasswordCubit>();

    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final formKey = GlobalKey<FormState>();

    final isPasswordObscure = useState(true);
    final isConfirmObscure = useState(true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<SetPasswordCubit, SetPasswordState>(
            listener: (context, state) {
              context.hideLoading();

              switch (state) {
                case SetPasswordLoadingState _:
                  context.showLoading();

                case SetPasswordSuccessState _:
                  context.go(Routes.createUser);

                case SetPasswordErrorState _:
                  context.showSnackBar(state.message, isError: true);
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// LOGO
                    Image.asset(
                      'assets/images/logo_mobeen.png',
                      height: 120,
                    ),
                    const Gap(12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withAlpha(25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "إعادة تعيين كلمة المرور",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Gap(12),
                    /// HEADER
                    const AuthHeader(
                      title: "تعيين كلمة مرور جديدة",
                      subtitle: "اختر كلمة مرور قوية وآمنة لحسابك",
                    ),
                    const Gap(20),
                    /// FORM
                    CustomContainerBox(
                      maxWidth: 25,
                      maxHeight: 40,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// PASSWORD
                            CustomTextField(
                              title: "كلمة المرور",
                              hintText: "أدخل كلمة المرور",
                              controller: passwordController,
                              obscureText: true,
                              isObscured: isPasswordObscure.value,
                              onToggleObscure: () {
                                isPasswordObscure.value =
                                    !isPasswordObscure.value;
                              },
                              validator: Validators.validatePassword,
                            ),
                            const Gap(20),
                            /// CONFIRM PASSWORD
                            CustomTextField(
                              title: "تأكيد كلمة المرور",
                              hintText: "أعد إدخال كلمة المرور",
                              controller: confirmPasswordController,
                              obscureText: true,
                              isObscured: isConfirmObscure.value,
                              onToggleObscure: () {
                                isConfirmObscure.value =
                                    !isConfirmObscure.value;
                              },
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return "كلمتا المرور غير متطابقتين";
                                }
                                return null;
                              },
                            ),
                            const Gap(20),
                            /// BUTTON
                            CustomButton(
                              title: "حفظ كلمة المرور",
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                cubit.getSetPasswordMethod(
                                  password: passwordController.text,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Gap(20),
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