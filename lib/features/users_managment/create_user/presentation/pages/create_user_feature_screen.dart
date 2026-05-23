import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/widgets/buttons/custom_submit_button.dart';
import 'package:mobeen/core/widgets/cards/custom_container_box.dart';
import 'package:mobeen/core/widgets/fields/custom_text_field.dart';
import 'package:mobeen/core/widgets/headers/web_header.dart';
import 'package:mobeen/features/users_managment/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:mobeen/features/users_managment/create_user/presentation/cubit/create_user_state.dart';
import 'package:mobeen/features/users_managment/create_user/presentation/widgets/custom_dropdown_button.dart';
import 'package:sizer/sizer.dart';

class CreateUserFeatureScreen extends HookWidget {
  const CreateUserFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateUserCubit>();
    final theme = Theme.of(context);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();

    final selectedRole = useValueNotifier<String?>(null);

    return Scaffold(
      body: SafeArea(
        child: BlocListener<CreateUserCubit, CreateUserState>(
          listener: (context, state) {
            if (state is CreateUserLoadingState) {
              context.showLoading();
            }

            if (state is CreateUserSuccessState) {
              context.pop();
              context.showSnackBar("تم إنشاء المستخدم بنجاح");
            }

            if (state is CreateUserErrorState) {
              context.pop();
              context.showSnackBar(state.message);
            }
          },

          child: Padding(
            padding: const EdgeInsets.all(100),
            child: BlocBuilder<CreateUserCubit, CreateUserState>(
              builder: (context, state) {
                if (state is CreateUserInitialState) {
                  return Column(
                    children: [
                      WebHeader(
                        title: "الرجاء إدخال معلومات المستخدم",
                        buttonTitle: "الرجوع",
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      Gap(10.sh),
                      CustomContainerBox(
                        maxWidth: 150,
                        maxHeight: 150,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 0,
                              childAspectRatio: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                CustomTextField(
                                  title: "الإسم",
                                  hintText: "الإسم",
                                  controller: nameController,
                                ),
                                CustomTextField(
                                  title: "البريد الإلكتروني",
                                  hintText: "البريد الإلكتروني",
                                  controller: emailController,
                                ),
                                CustomTextField(
                                  title: "رقم الجوال",
                                  hintText: "رقم الجوال",
                                  controller: phoneController,
                                ),
                                CustomDropdownButton(
                                  title: "الدور",
                                  hintText: "اختر الدور",
                                  value: selectedRole.value,
                                  items: const {
                                    'مدير نظام': 'admin',
                                    'مشرف': 'supervisor',
                                    'باحث ميداني': 'researcher',
                                    'محلل بيانات': 'data_analyst',
                                  },
                                  onChanged: (newValue) {
                                    selectedRole.value = newValue;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      CustomSubmitButton(
                        title: "إضافة",
                        onPressed: () async {
                          if (selectedRole.value != null) {
                            cubit.getCreateUserMethod(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              role: selectedRole.value!,
                            );
                          }
                        },
                      ),
                    ],
                  );
                } else if (state is CreateUserErrorState) {
                  return Text(state.message, style: theme.textTheme.labelLarge);
                }
                return const Text("حدث خطأ في النظام");
              },
            ),
          ),
        ),
      ),
    );
  }
}
