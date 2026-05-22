import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final int questionNumber;
  final String title;
  final String type;
  final bool isRequired;
  final dynamic options;

  const QuestionsWidget({
    super.key,
    required this.questionNumber,
    required this.title,
    required this.type,
    required this.options,
    this.isRequired = true,
  });

  List<String> parseOptions() {
    if (options == null) return [];
    if (options is List) {
      return (options as List).map((e) => e.toString()).toList();
    }
    if (options is Map && options['options'] is List) {
      return (options['options'] as List).map((e) => e.toString()).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final parsedOptions = parseOptions();
    String typeLabel;
    IconData typeIcon;
    bool hasOptions = false;

    switch (type.toLowerCase()) {
      case 'multiple_choice':
        typeLabel = 'اختيار من متعدد';
        typeIcon = Icons.list_alt_rounded;
        hasOptions = true;
        break;
      case 'text':
        typeLabel = 'نص مفتوح';
        typeIcon = Icons.notes_rounded;
        hasOptions = false;
        break;
      case 'checkbox':
        typeLabel = 'خيارات متعددة';
        typeIcon = Icons.check_box_outlined;
        hasOptions = true;
        break;
      default:
        typeLabel = 'نص مفتوح';
        typeIcon = Icons.short_text_rounded;
        hasOptions = false;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEBEBEB), width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A27),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Q$questionNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: isRequired
                          ? const Color(0xFFFCE8E6)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      isRequired ? 'إلزامي' : 'اختياري',
                      style: TextStyle(
                        color: isRequired
                            ? const Color(0xFFD93025)
                            : Colors.grey.shade600,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Question Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A27),
            ),
          ),

          // Selection Options List Builder
          if (hasOptions && parsedOptions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Column(
              children: parsedOptions.map((optionText) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Icon(
                        type.toLowerCase() == 'multiple_choice'
                            ? Icons.radio_button_off_outlined
                            : Icons.check_box_outline_blank,
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          optionText,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],

          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFEBEBEB)),
          const SizedBox(height: 12),

          // Footer Row - Displays mapped translations automatically
          Row(
            children: [
              Icon(typeIcon, size: 16, color: Colors.grey.shade500),
              const SizedBox(width: 6),
              Text(
                typeLabel,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
