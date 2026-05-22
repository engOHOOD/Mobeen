import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/features/form_management/create_form/presentation/widgets/build_options.dart';

class CreateFormWidget extends HookWidget {
  final AddQuestion question;
  final Function(AddQuestion) onChanged;
  final VoidCallback onDelete;

  const CreateFormWidget({
    super.key,
    required this.question,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: question.label);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "السؤال"),
            onChanged: (val) {
              question.label = val;

              onChanged(question);
            },
          ),

          Gap(10),

          DropdownButtonFormField<QuestionType>(
            initialValue: question.type,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: QuestionType.text, child: Text("نص")),

              DropdownMenuItem(value: QuestionType.number, child: Text("رقم")),

              DropdownMenuItem(
                value: QuestionType.mcq,
                child: Text("اختيارات متعددة"),
              ),

              DropdownMenuItem(
                value: QuestionType.checkbox,
                child: Text("مربعات اختيار"),
              ),

              DropdownMenuItem(
                value: QuestionType.dropdown,
                child: Text("القائمة المنسدلة"),
              ),
            ],
            onChanged: (val) {
              if (val == null) return;

              question.type = val;

              final hasOptions =
                  val == QuestionType.mcq ||
                  val == QuestionType.checkbox ||
                  val == QuestionType.dropdown;

              question.options = hasOptions ? [''] : [];

              onChanged(question);
            },
          ),

          Gap(10),

          if (question.type == QuestionType.mcq ||
              question.type == QuestionType.checkbox ||
              question.type == QuestionType.dropdown)
            BuildOptions(question: question, onChanged: onChanged),

          Gap(10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete, color: AppColors.error),
              ),

              Row(
                children: [
                  const Text("إجباري"),

                  Switch(
                    value: question.required,
                    onChanged: (val) {
                      question.required = val;

                      onChanged(question);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
