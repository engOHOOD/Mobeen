import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/features/tasks/domain/use_cases/tasks_use_case.dart';
import 'package:mobeen/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:mobeen/features/tasks/presentation/widgets/assign_task_bottom_sheet.dart';
import 'package:mobeen/features/team/domain/use_cases/team_use_case.dart';

class TasksFeatureScreen extends HookWidget {
  final String locationId;

  const TasksFeatureScreen({super.key, required this.locationId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          TasksCubit(GetIt.I.get<TasksUseCase>(), GetIt.I.get<TeamUseCase>()),
      child: AssignTaskBottomSheet(locationId: locationId),
    );
  }
}
