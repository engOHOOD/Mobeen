import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/core/widgets/headers/form_header.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/cubit/assign_form_cubit.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/cubit/assign_form_state.dart';
import 'package:mobeen/features/form_management/assign_form/presentation/widgets/team_list.dart';

class AssignFormFeatureScreen extends HookWidget {
  const AssignFormFeatureScreen({super.key, required this.form});
  final FormEntity form;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AssignFormCubit>();
    final selectedUserIds = useState<List<String>>([]);
    final userTargets = useState<Map<String, int>>({});
    cubit.getAssignFormMethod(formId: form.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تعديل الباحثين',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xff074D31),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderWidget(
              title: form.title,
              description: form.description,
              isEnabled: form.isEnabled,
              target: form.target,
              achieved: form.achieved,
            ),
            const Gap(24),
            const Divider(color: Color(0xFFEBEBEB), height: 1),
            const Gap(16),
            const Text(
              "الباحثين الميدانيين",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff074D31),
              ),
            ),
            const Gap(12),
            Expanded(
              child: BlocBuilder<AssignFormCubit, AssignFormState>(
                builder: (context, state) {
                  if (state is AssignFormInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff074D31),
                      ),
                    );
                  }

                  if (state is AssignFormSuccessState) {
                    if (state.team.isEmpty) {
                      return const Center(
                        child: Text(
                          "لا يوجد باحثون متاحون لإسنادهم لهذا النموذج حالياً",
                          style: TextStyle(color: Colors.grey),
                        ), 
                      );
                    }

                    return TeamListView(
                      team: state.team,
                      selectedUserIds: selectedUserIds,
                      userTargets: userTargets,
                    );
                  }

                  if (state is AssignFormErrorState) {
                    return const Center(child: Text('حدث خطأ بالنظام'));
                  }
                  return const Center(child: Text('لا يوجد أعضاء بالفريق'));
                },
              ),
            ),
            CustomButton(
              title: 'حفظ',
              onPressed: () {
                final userIds = selectedUserIds.value;
                final targets = userTargets.value;

                if (userIds.isEmpty) return;

                for (final id in userIds) {
                  cubit.assignForm(
                    userId: id,
                    formId: form.id,
                    target: targets[id]?.toString() ?? "0",
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
