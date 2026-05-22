import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/core/widgets/headers/web_header.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/cubit/view_users_cubit.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/cubit/view_users_state.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/widgets/build_data_row.dart';
import 'package:mobeen/features/users_managment/view_users/presentation/widgets/table_header.dart';
import 'package:sizer/sizer.dart';

class ViewUsersFeatureScreen extends StatelessWidget {
  const ViewUsersFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ViewUsersCubit>();
    cubit.getViewUsersMethod();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WebHeader(
                title: "المستخدمين",
                buttonTitle: "إضافة مستخدم",
                onPressed: () {
                  context.push("${Routes.viewUsers}${Routes.createUser}");
                },
              ),
              Gap(10.sh),
              BlocBuilder<ViewUsersCubit, ViewUsersState>(
                builder: (context, state) {
                  if (state is ViewUsersInitialState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ViewUsersSuccessState) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow.withAlpha(40),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: DataTable(
                          columnSpacing: 150,
                          horizontalMargin: 30,
                          dividerThickness: 0,
                          dataRowColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          headingRowColor: .all(AppColors.textTertiary),
                          columns: [
                            DataColumn(label: TableHeader(text: 'الاسم الثلاثي')),
                            DataColumn(
                              label: TableHeader(text: 'البريد الإلكتروني'),
                            ),
                            DataColumn(label: TableHeader(text: 'الدور')),
                            DataColumn(label: TableHeader(text: 'مفعل')),
                          ],
                          rows: List.generate(
                            state.users.length,
                            (index) => buildDataRow(index, state.users),
                          ),
                        ),
                      ),
                    );
                  } else if (state is ViewUsersErrorState) {
                    return Center(
                      child: Text("نعتذر، حدث خطأ بالنظام، حاول مرة أخرى"),
                    );
                  }
                  return Center(
                    child: Text("نعتذر، حدث خطأ بالنظام، حاول مرة أخرى"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
