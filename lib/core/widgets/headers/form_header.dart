import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  final String title;
  final String? description;
  final bool isEnabled;
  final int target;
  final int achieved;

  const FormHeaderWidget({
    super.key,
    required this.title,
    this.description,
    this.isEnabled = true,
    required this.target,
    required this.achieved,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate progress ratio safely to avoid division by zero
    final double progressPercentage = target > 0 ? (achieved / target) : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2EFE5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row containing title and green activation badge
          Row(
            // FIXED: Added missing class descriptor prefix 'MainAxisAlignment'
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A27),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isEnabled
                      ? const Color(0xFFE8F6ED)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isEnabled ? 'نشط' : 'ملغي',
                  style: TextStyle(
                    color: isEnabled ? const Color(0xFF2D9D53) : Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Form description text body
          Text(
            description ?? 'لا يوجد وصف متاح لهذا النموذج حالياً.',
            style: const TextStyle(
              color: Color(0xFF5A6B5D),
              fontSize: 13,
              height: 1.5,
            ),
          ),

          const Divider(height: 24, color: Color(0xFFEFEFEF), thickness: 1),

          // DYNAMIC RESPONSE TRACKER (From your constructor parameters)
          const Text(
            'عدد الاستجابات',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '$achieved',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A27),
                ),
              ),
              Text(
                ' من أصل $target مستهدف',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progressPercentage > 1.0 ? 1.0 : progressPercentage,
              minHeight: 8,
              backgroundColor: Colors.grey.shade100,
              color: const Color(0xFF2D9D53),
            ),
          ),
        ],
      ),
    );
  }
}
