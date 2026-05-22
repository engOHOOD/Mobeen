import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/widgets/headers/web_header.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/cubit/view_organization_cubit.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/cubit/view_organization_state.dart';
import 'package:mobeen/features/organizations_managment/view_organization/presentation/widgets/organization_card_widget.dart';

class ViewOrganizationFeatureScreen extends StatelessWidget {
  const ViewOrganizationFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = context.read<ViewOrganizationCubit>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebHeader(
              title: "الشركات",
              buttonTitle: "إضافة شركات",
              onPressed: () {
                context.push(Routes.createOrganization);
              },
            ),

            const Gap(30),

            Expanded(
              child: BlocBuilder<
                  ViewOrganizationCubit,
                  ViewOrganizationState>(
                builder: (context, state) {
                  if (state is ViewOrganizationInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ViewOrganizationSuccessState) {
                    if (state.organizations.isEmpty) {
                      return const Center(
                        child: Text(
                          "لا توجد شركات",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }

                    return GridView.builder(
                      itemCount: state.organizations.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.85,
                      ),

                      itemBuilder: (context, index) {
                       
                        return OrganizationCardWidget(
                          organization:  state.organizations[index],
                        );
                      },
                    );
                  }

                  if (state is ViewOrganizationErrorState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}