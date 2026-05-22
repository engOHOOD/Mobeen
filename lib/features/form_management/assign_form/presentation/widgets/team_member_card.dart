
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/widgets/custom_checkbox.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/widgets/target_widget.dart';

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({
    super.key,
    required this.user,
    required this.isChecked,
    required this.selectedUserIds,
    required this.userTargets,
  });

  final UserEntity user;
  final bool isChecked;
  final ValueNotifier<List<String>> selectedUserIds;
  final ValueNotifier<Map<String, int>> userTargets;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(14),
      margin: .all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isChecked ? const Color(0xff074D31) : const Color(0xFFEBEBEB),
          width: isChecked ? 2.0 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomCheckbox(
            isChecked: isChecked,
            onTap: () {
              final currentList = List<String>.from(selectedUserIds.value);
              if (isChecked) {
                currentList.remove(user.id);
              } else {
                currentList.add(user.id);
              }
              selectedUserIds.value = currentList;
            },
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff074D31),
                    fontSize: 14,
                  ),
                ),
                const Gap(10),
                TargetInputField(
                  userId: user.id,
                  selectedUserIds: selectedUserIds,
                  userTargets: userTargets,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
