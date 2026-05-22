import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/cards/custom_toggle.dart';
import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:mobeen/features/location_management/live_location/presentation/pages/live_location_feature_screen.dart';
import 'package:mobeen/features/team/presentation/cubit/team_cubit.dart';
import 'package:mobeen/features/team/presentation/cubit/team_state.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_cubit.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_state.dart';
import 'package:mobeen/features/team/presentation/pages/team_feature_screen.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

enum LiveTeamViewType { map, list }

class LiveTeamFeatureScreen extends HookWidget {
  const LiveTeamFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewType = useState(TeamViewType.management);

    final teamCubit = context.read<TeamCubit>();
    final locationCubit = context.read<LiveLocationCubit>();
    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;

    useEffect(() {
      teamCubit.getTeam();
      locationCubit.startLiveLocationStream();
      return () {
        locationCubit.stopLiveLocationStream();
      };
    }, []);

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SectionTitle(title: 'الفريق'),
              Gap(20),
              CustomToggle(
                selected: viewType.value,
                onChanged: (v) => viewType.value = v,
                items: {
                  TeamViewType.management: "إدارة الفريق",
                  TeamViewType.live: "المواقع المباشرة",
                },
              ),
              Gap(20),
              Expanded(
                child: BlocBuilder<TeamCubit, TeamState>(
                  builder: (context, teamState) {
                    teamState is GetTeamSuccessState
                        ? teamState.team
                        : <UserEntity>[];
                    return BlocBuilder<LiveLocationCubit, LiveLocationState>(
                      builder: (context, locationState) {
                        locationState is LiveLocationSuccessState
                            ? locationState.locations
                            : <LiveLocationEntity>[];
                        if (viewType.value == TeamViewType.management) {
                          return TeamFeatureScreen();
                        }
                        return LiveLocationFeatureScreen();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
