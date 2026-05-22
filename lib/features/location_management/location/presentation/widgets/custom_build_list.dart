import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:mobeen/core/navigation/routers.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';
import 'package:mobeen/features/location_management/location/presentation/cubit/location_cubit.dart';
import 'package:mobeen/features/location_management/location/presentation/pages/location_details_screen.dart';

class CustomBuildList extends StatelessWidget {
  const CustomBuildList({super.key, required this.locations});
  final List<LocationEntity> locations;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (locations.isEmpty) {
      return Center(
        child: Text("لا توجد مواقع حالياً", style: theme.textTheme.bodyLarge),
      );
    }

    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withAlpha(20),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (pageContext) {
                    final cubit = context.read<LocationCubit>();

                    return BlocProvider.value(
                      value: cubit,
                      child: LocationDetailsPage(location: location),
                    );
                  },
                ),
              );
            },
            leading: const Icon(Icons.location_on, color: AppColors.primary),
            title: Text(location.name!),
            subtitle: Text("${location.latitude}, ${location.longitude}"),
          ),
        );
      },
    );
  }
}
