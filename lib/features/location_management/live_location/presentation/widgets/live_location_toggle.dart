import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/services/location_service.dart';
import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/services/user_service.dart';

class LiveLocationToggle extends HookWidget {
   const LiveLocationToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnabled = useState(false);
    final cubit = context.read<LiveLocationCubit>();
    final user = GetIt.I<UserService>().getUser;
    final locationService = GetIt.I<LocationService>();
    final theme = Theme.of(context);

    return Container(
      padding:  EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.secondary),
        color: theme.colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            " مشاركة الموقع المباشر",
             style: theme.textTheme.labelLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
          ),
          Switch(
            value: isEnabled.value,
            activeThumbColor: AppColors.primary,
            inactiveThumbColor: AppColors.secondary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (value) async {
              isEnabled.value = value;
              if (value) {
                cubit.startSharingLocation(() async {
                  final userId = user?.id;
                  final position =
                      await locationService.determinePosition();
                  return LiveLocationEntity(
                    userId: userId ?? '',
                    latitude: position.latitude,
                    longitude: position.longitude,
                    updatedAt: DateTime.now(),
                  );
                });
              } else {
                cubit.stopSharingLocation();
              }
            },
          ),
        ],
      ),
    );
  }
}