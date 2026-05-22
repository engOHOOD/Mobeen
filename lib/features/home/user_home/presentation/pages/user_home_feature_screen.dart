import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/researcher_home_card.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/statics_card_mobile.dart';
import 'package:mobeen/features/home/user_home/presentation/cubit/user_home_cubit.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

class UserHomeFeatureScreen extends StatelessWidget {
  const UserHomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<UserHomeCubit>();
    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;
    final role = user?.role;

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              children: [
                if (role?.toLowerCase() == "researcher")
                  Column(
                    children: [
                      SectionTitle(title: "مهمتك الحالية"),
                      ResearcherHomeCard(
                        title: "فندق دار التوحيد - إبراهيم الخليل",
                        subtitle: "رقم المركز - الجنسية : بنجلاديش - 154",
                        buttonText: "متابعة المهمة",
                        onTap: () {},
                      ),
                    ],
                  ),
                Gap(30),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                  children: const [
                    StaticsCardMobile(
                      title: "عدد الإجابات",
                      value: "120",
                      icon: Icons.question_answer_outlined,
                    ),
                    StaticsCardMobile(
                      title: "عدد النماذج",
                      value: "15",
                      icon: Icons.description_outlined,
                    ),
                    StaticsCardMobile(
                      title: "عدد إثباتات الحالة",
                      value: "8",
                      icon: Icons.fact_check_outlined,
                    ),
                    StaticsCardMobile(
                      title: "عدد بطاقات التحدي",
                      value: "42",
                      icon: Icons.workspace_premium_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
