import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/fields/custom_text_field.dart';
import 'package:mobeen/features/form_management/create_form/presentation/cubit/create_form_cubit.dart';
import 'package:mobeen/features/form_management/create_form/presentation/cubit/create_form_state.dart';
import 'package:mobeen/features/form_management/create_form/presentation/widgets/create_form_widget.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

class CreateFormFeatureScreen extends HookWidget {
  const CreateFormFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateFormCubit>();

    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;

    final titleController = useTextEditingController();
    final descController = useTextEditingController();
    final targetController = useTextEditingController();

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),

      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  /// HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),

                      const SectionTitle(title: "إنشاء النموذج"),
                    ],
                  ),

                  const Gap(16),

                  /// MAIN CONTAINER
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(15),

                        borderRadius: BorderRadius.circular(28),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(10),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            /// FORM INFO SECTION
                            const SectionTitle(title: "بيانات النموذج"),

                            const Gap(16),

                            Container(
                              padding: const EdgeInsets.all(18),

                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(24),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(8),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),

                              child: Column(
                                children: [
                                  CustomTextField(
                                    title: "عنوان النموذج",
                                    controller: titleController,
                                    hintText: "عنوان النموذج",
                                  ),

                                  const Gap(16),

                                  CustomTextField(
                                    title: "وصف النموذج",
                                    controller: descController,
                                    hintText: "وصف النموذج",
                                  ),
                                                    const Gap(16),

                                  CustomTextField(
                                    title: "العدد المطلوب",
                                    controller: descController,
                                    hintText: "العدد المطلوب",
                                  ),
                                ],
                              ),
                            ),

                            const Gap(24),

                            /// QUESTIONS SECTION
                            const SectionTitle(title: "الأسئلة"),

                            const Gap(16),

                            BlocBuilder<CreateFormCubit, CreateFormState>(
                              builder: (context, state) {
                                if (state is CreateFormLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is CreateFormSuccessState) {
                                  final questions = state.questions;

                                  return Column(
                                    children: [
                                      ...List.generate(questions.length, (
                                        index,
                                      ) {
                                        final q = questions[index];

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 16,
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.all(16),

                                            decoration: BoxDecoration(
                                              color: Colors.white,

                                              borderRadius:
                                                  BorderRadius.circular(24),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withAlpha(
                                                    8,
                                                  ),
                                                  blurRadius: 12,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),

                                            child: CreateFormWidget(
                                              question: q,

                                              onDelete: () {
                                                cubit.removeQuestion(index);
                                              },

                                              onChanged: (updated) {
                                                cubit.updateQuestion();
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  );
                                }

                                return const SizedBox.shrink();
                              },
                            ),

                            const Gap(20),

                            /// ADD QUESTION BUTTON
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: double.infinity,

                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),

                          side: BorderSide(color: AppColors.greenPrimary),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        onPressed: () {
                          cubit.addQuestion(
                            AddQuestion(
                              id: '',
                              label: '',
                              type: QuestionType.text,
                            ),
                          );
                        },

                        icon: const Icon(Icons.add_rounded),

                        label: const Text("إضافة سؤال"),
                      ),
                    ),
                  ),
                  const Gap(16),

                  /// CREATE BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),

                    child: SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenLight,
                          foregroundColor: AppColors.greenPrimary,
                          side: BorderSide(color: AppColors.greenSecondary),

                          elevation: 0,

                          padding: const EdgeInsets.symmetric(vertical: 18),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        onPressed: () {
                          cubit.createForm(
                            title: titleController.text,
                            description: descController.text,
                            target: int.tryParse(targetController.text) ?? 0,
                          );
                        },

                        child: const Text("إنشاء النموذج"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
