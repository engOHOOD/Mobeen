import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/buttons/custom_button.dart';
import 'package:mobeen/core/widgets/cards/questions_widget.dart';
import 'package:mobeen/core/widgets/headers/form_header.dart';
import 'package:mobeen/features/form_management/view_form/presentation/cubit/view_form_cubit.dart';
import 'package:mobeen/features/form_management/view_form/presentation/cubit/view_form_state.dart';

class ViewFormFeatureScreen extends StatelessWidget {
  const ViewFormFeatureScreen({super.key, required this.formEntity});
  final FormEntity formEntity;
  @override
  Widget build(BuildContext context) {
    final role = GetIt.I<UserService>().getUser!.role;
    final cubit = context.read<ViewFormCubit>();
    cubit.getViewFormMethod(formId: formEntity.id);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FormHeaderWidget(
              title: formEntity.title,
              description: formEntity.description,
              isEnabled: formEntity.isEnabled,
              target: formEntity.target,
              achieved: formEntity.achieved,
            ),

            BlocBuilder<ViewFormCubit, ViewFormState>(
              builder: (context, state) {
                if (state is ViewFormInitialState) {
                  Center(child: CircularProgressIndicator());
                }
                if (state is ViewFormSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.questions.length,
                      itemBuilder: (context, index) => QuestionsWidget(
                        title: state.questions[index].question,
                        type: state.questions[index].type,
                        options: state.questions[index].options,
                        questionNumber: state.questions[index].sort,
                        isRequired: state.questions[index].isRequired,
                      ),
                    ),
                  );
                }
                if (state is ViewFormErrorState) {
                  Center(child: Text('حدث خطأ في النظام'));
                }
                return SizedBox.shrink();
              },
            ),
            if (role == 'supervisor')
              CustomButton(
                title: 'إسناد باحث',
                onPressed: () {
                  context.push(
                    "${Routes.secondTab}/${Routes.viewForm}/${Routes.assignForm}",
                    extra: formEntity,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
