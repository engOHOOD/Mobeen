import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobeen/features/auth/sub/log_out/presentation/pages/log_out_feature_widget.dart';
import 'package:mobeen/features/location_management/live_location/presentation/widgets/live_location_toggle.dart';
import 'package:mobeen/features/user_profile/presentation/cubit/user_profile_cubit.dart';
import 'package:mobeen/features/user_profile/presentation/cubit/user_profile_state.dart';
import 'package:mobeen/features/user_profile/presentation/widgets/custom_info_card.dart';
import 'package:mobeen/features/user_profile/presentation/widgets/custom_profile_card.dart';

class UserProfileFeatureScreen extends StatelessWidget {
  const UserProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileSuccessState) {
              final user = state.user;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWeb ? 120 : 16,
                  vertical: isWeb ? 32 : 16,
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Gap(20),
                          CustomProfileCard(name: user.name, role: user.role),
                          Gap(20),
                          CustomInfoCard(
                            organisation: user.organisationName ?? "-",
                            email: user.email,
                            phone: user.phoneNumber ?? "-",
                          ),
                          Gap(16),
                          if (user.role.toLowerCase() == "researcher")
                            LiveLocationToggle(),
                        ],
                      ),
                    ),
                    LogOutFeatureWidget(),
                    Gap(8),
                  ],
                ),
              );
            }
            if (state is UserProfileErrorState) {
              return Center(child: Text(state.message));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
