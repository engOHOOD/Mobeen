import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/buttons/custom_add_button.dart';
import 'package:mobeen/core/widgets/cards/custom_toggle.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/cubit/view_forms_cubit.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/cubit/view_forms_state.dart';
import 'package:mobeen/features/form_management/view_forms/presentation/widgets/list_forms_widget.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

class ViewFormsFeatureScreen extends HookWidget {
  const ViewFormsFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final statusFilter = useState<bool>(true);

    final cubit = context.read<ViewFormsCubit>();

    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;
    final role = user?.role;

    cubit.getViewFormsMethod();
    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SectionTitle(title: 'النماذج'),
            Gap(20),
            CustomToggle(
              selected: statusFilter.value,
              items: const {true: "مفعل", false: "غير مفعل"},
              onChanged: (value) {
                statusFilter.value = value;
              },
            ),
            Gap(12),
            BlocBuilder<ViewFormsCubit, ViewFormsState>(
              builder: (context, state) {
                if (state is ViewFormsInitialState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ViewFormsSuccessState) {
                  final filteredForms = state.forms
                      .where((f) => f.isEnabled == statusFilter.value)
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredForms.length,
                      itemBuilder: (context, index) {
                        final form = filteredForms[index];

                        return InkWell(
                          onTap: () {
                            if (role == 'researcher') {
                              context.push(
                                "${Routes.secondTab}/${Routes.fillForm}",
                                extra: form.id,
                              );
                            } else {
                              context.push(
                                "${Routes.secondTab}/${Routes.viewForm}",
                                extra: form,
                              );
                            }
                          },
                          child: ListFormsWidget(
                            progress: form.achieved,
                            target: form.target,
                            title: form.title,
                            status: form.isEnabled,
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ViewFormsErrorState) {
                  return Center(
                    child: Text("${state.message} خطأ بالنظام حاول مرة اخرى"),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),

      floatingActionButton: role == 'data_analyst'
    ? CustomAddButton(
      title: "نموذج جديد",
        icon: Icons.add_rounded,
        onTap: () {
          context.push("${Routes.secondTab}/${Routes.createForm}");
        },
      )
    : null,
    );
  }
}
