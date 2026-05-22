import 'package:flutter/material.dart';

class TargetInputField extends StatelessWidget {
  const TargetInputField({
    super.key,
    required this.userId,
    required this.selectedUserIds,
    required this.userTargets,
  });

  final String userId;
  final ValueNotifier<List<String>> selectedUserIds;
  final ValueNotifier<Map<String, int>> userTargets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: 140,
      child: TextFormField(
        initialValue: userTargets.value[userId]?.toString() ?? '',
        keyboardType: TextInputType.number,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: 'العدد المستهدف',
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          filled: true,
          fillColor: const Color(0xffF8FAF9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff074D31), width: 1.2),
          ),
        ),
        onChanged: (val) {
          final updatedTargets = Map<String, int>.from(userTargets.value);
          final currentList = List<String>.from(selectedUserIds.value);
          final parsedTarget = int.tryParse(val);

          if (parsedTarget != null && parsedTarget > 0) {
            updatedTargets[userId] = parsedTarget;
            if (!currentList.contains(userId)) {
              currentList.add(userId);
            }
          } else {
            updatedTargets.remove(userId);
            currentList.remove(userId);
          }
          userTargets.value = updatedTargets;
          selectedUserIds.value = currentList;
        },
      ),
    );
  }
}
