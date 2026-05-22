import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/features/team/presentation/cubit/team_cubit.dart';
import 'package:mobeen/features/team/presentation/cubit/team_state.dart';
import 'package:mobeen/features/team/presentation/widgets/add_team_button.dart';
import 'package:mobeen/features/team/presentation/widgets/custom_team_list.dart';

class TeamFeatureScreen extends HookWidget {
  const TeamFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeamCubit>();

    return 
       BlocListener<TeamCubit, TeamState>(
        listener: (context, state) {
          if (state is TeamErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is GetTeamSuccessState ||
              state is GetAvailableResearchersSuccessState) {
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<TeamCubit, TeamState>(
                    builder: (context, state) {
                      final team = cubit.team;
                      final available = cubit.availableResearchers;
                      return Column(
                        children: [
                          Expanded(
                            child: CustomTeamList(
                              team: team,
                              onRemove: (id) {
                                cubit.removeResearcher(id);
                              },
                            ),
                          ),
                          Gap(20),
                          AddTeamButton(
                            availableResearchers: available,
                            onAdd: (id) {
                              cubit.addResearcher(id);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Gap(20),
              ],
            ),
          ),
        ),
    );
  }
}
