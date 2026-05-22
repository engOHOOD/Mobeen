import 'package:flutter/material.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/widgets/team_member_card.dart';

class TeamListView extends StatelessWidget {
  const TeamListView({
    super.key,
    required this.team,
    required this.selectedUserIds,
    required this.userTargets,
  });

  final List<UserEntity> team;
  final ValueNotifier<List<String>> selectedUserIds;
  final ValueNotifier<Map<String, int>> userTargets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: team.length,
      itemBuilder: (context, index) {
        final user = team[index];
        final bool isChecked = selectedUserIds.value.contains(user.id);

        return TeamMemberCard(
          user: user,
          isChecked: isChecked,
          selectedUserIds: selectedUserIds,
          userTargets: userTargets,
        );
      },
    );
  }
}
