import 'package:flutter/material.dart';
import 'package:mobeen/core/common/entity/add_question.dart';

class BuildOptions extends StatelessWidget {
  const BuildOptions({
    super.key,
    required this.question,
    required this.onChanged,
  });
  final AddQuestion question;
  final Function(AddQuestion) onChanged;
  @override
  Widget build(BuildContext context) {
    return  Column(
    children: [
      ...List.generate(question.options.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'الخيار ${index + 1}',
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    question.options[index] = val;

                    onChanged(question);
                  },
                ),
              ),

              IconButton(
                onPressed: () {
                  question.options.removeAt(index);

                  onChanged(question);
                },
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            ],
          ),
        );
      }),

      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            question.options.add('');

            onChanged(question);
          },
          child: const Text("إضافة خيار"),
        ),
      ),
    ],
  );
}}
