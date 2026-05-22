import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/extensions/context_extensions.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/features/form_management/fill_form/presentation/cubit/fill_form_cubit.dart';
import 'package:mobeen/features/form_management/fill_form/presentation/cubit/fill_form_state.dart';
import 'package:mobeen/features/form_management/fill_form/presentation/widgets/translate_stt.dart';
import 'package:mobeen/features/form_management/fill_form/sub/translator_tts/presentation/pages/translator_tts_feature_widget.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';
import 'package:mobeen/features/translate/domain/use_cases/translate_use_case.dart';
import 'package:mobeen/features/translate/presentation/cubit/translate_cubit.dart';

class FillFormFeatureScreen extends StatelessWidget {
  final String formId;

  const FillFormFeatureScreen({super.key, required this.formId});

  String _buildTranslatableText(String question, List<String>? options) {
    if (options == null || options.isEmpty) {
      return question;
    }

    final buffer = StringBuffer(question)..writeln('\n:الخيارات');
    for (var i = 0; i < options.length; i++) {
      buffer.writeln('${i + 1}. ${options[i]}');
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FillFormCubit>();
    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;
    cubit.getForm(formId: formId);

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),

      body: BlocBuilder<FillFormCubit, FillFormState>(
        builder: (context, state) {
          if (state is FillFormInitialState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FillFormErrorState) {
            return Center(child: Text('حدث خطأ بالنظام'));
          }
          if (state is FillFormSuccessState) {
            final questions = state.generateForm.questions;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                          SectionTitle(title: "تعبئة النموذج"),
                        ],
                      ),
                      Gap(16),
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
                          child: ListView(
                            padding: EdgeInsets.all(16),
                            children: [
                              ...questions.map((q) {
                                final fullTranslatableText =
                                    _buildTranslatableText(
                                      q.question,
                                      q.options,
                                    );

                                switch (q.type) {
                                  case 'text':
                                    return Padding(
                                      padding: .only(bottom: 16),
                                      child: Container(
                                        padding: const EdgeInsets.all(18),

                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),

                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(8),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            BlocProvider(
                                              create: (_) => TranslateCubit(
                                                GetIt.I<TranslateUseCase>(),
                                              ),
                                              child:
                                                  const SpeakAndTranslateSection(),
                                            ),
                                            TranslatorTtsFeatureWidget(
                                              initialText: fullTranslatableText,
                                            ),
                                            Gap(8),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: q.question,

                                                filled: true,
                                                fillColor: Colors.grey.shade50,

                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10,
                                                    ),

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide.none,
                                                ),

                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),

                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                              ),
                                              onChanged: (v) {
                                                cubit.updateAnswer(
                                                  formId: formId,
                                                  questionId: q.id,
                                                  value: v,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                  case 'number':
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 24),
                                      child: Container(
                                        padding: const EdgeInsets.all(18),

                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),

                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(8),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TranslatorTtsFeatureWidget(
                                              initialText: fullTranslatableText,
                                            ),
                                            Gap(8),
                                            TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: q.question,

                                                filled: true,
                                                fillColor: Colors.grey.shade50,

                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 18,
                                                    ),

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide.none,
                                                ),

                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),

                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                              ),
                                              onChanged: (v) {
                                                cubit.updateAnswer(
                                                  formId: formId,
                                                  questionId: q.id,
                                                  value: v,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                  case 'dropdown':
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 24),
                                      child: Container(
                                        padding: const EdgeInsets.all(18),

                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),

                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(8),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TranslatorTtsFeatureWidget(
                                              initialText: fullTranslatableText,
                                            ),
                                            Gap(8),
                                            DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                hintText: q.question,

                                                filled: true,
                                                fillColor: Colors.grey.shade50,

                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 18,
                                                    ),

                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  borderSide: BorderSide.none,
                                                ),

                                                enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),

                                                focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            18,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                              ),
                                              items: (q.options)
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ),
                                                  )
                                                  .toList(),
                                              onChanged: (v) {
                                                cubit.updateAnswer(
                                                  formId: formId,
                                                  questionId: q.id,
                                                  value: v ?? '',
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                  case 'checkbox':
                                    return StatefulBuilder(
                                      builder:
                                          (
                                            BuildContext context,
                                            StateSetter setBoxState,
                                          ) {
                                            final currentSelections =
                                                List<String>.from(
                                                  cubit.getSelectedAnswer(
                                                        q.id,
                                                      ) ??
                                                      [],
                                                );

                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 24,
                                              ),
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                  18,
                                                ),

                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(24),

                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withAlpha(8),
                                                      blurRadius: 12,
                                                      offset: const Offset(
                                                        0,
                                                        4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TranslatorTtsFeatureWidget(
                                                      initialText:
                                                          fullTranslatableText,
                                                    ),
                                                    Gap(10),
                                                    Text(
                                                      q.question,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Gap(6),

                                                    ...(q.options).map((
                                                      option,
                                                    ) {
                                                      final isChecked =
                                                          currentSelections
                                                              .contains(option);

                                                      return CheckboxListTile(
                                                        title: Text(option),
                                                        value: isChecked,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        onChanged: (selected) {
                                                          setBoxState(() {
                                                            if (selected ==
                                                                true) {
                                                              currentSelections
                                                                  .add(option);
                                                            } else {
                                                              currentSelections
                                                                  .remove(
                                                                    option,
                                                                  );
                                                            }
                                                          });

                                                          cubit.updateAnswer(
                                                            formId: formId,
                                                            questionId: q.id,
                                                            value:
                                                                currentSelections,
                                                          );
                                                        },
                                                      );
                                                    }),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                    );

                                  default:
                                    return SizedBox.shrink();
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                      Gap(16),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: CustomButton(
                          borderColor: AppColors.greenSecondary,
                          backgroundColor: AppColors.greenLight,
                          textColor: AppColors.greenPrimary,
                          title: 'إرسال الإجابات',
                          onPressed: () {
                            cubit.submit();
                            context.showConfirmDialog(
                              confirmColorText:AppColors.greenPrimary,
                              confirmColor: AppColors.greenLight,
                              title: 'تم إرسال الإجابات بنجاح',
                              message: 'تم إرسال الإجابات بنجاح',
                              onConfirm: () {
                                context.pop();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
