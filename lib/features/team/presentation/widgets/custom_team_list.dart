import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';

class CustomTeamList extends StatelessWidget {
  const CustomTeamList({super.key, required this.team, required this.onRemove});
  final List<UserEntity> team;
  final Function(String id) onRemove;

  @override
  Widget build(BuildContext context) {
    if (team.isEmpty) {
      return const Center(child: Text("لا يوجد أعضاء في الفريق"));
    }

    return ListView.separated(
      itemCount: team.length,
      separatorBuilder: (_, _) => const Gap(10),
      itemBuilder: (context, index) {
        final user = team[index];

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(child: Text(user.name)),
              IconButton(
                onPressed: () => onRemove(user.id),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }
}
