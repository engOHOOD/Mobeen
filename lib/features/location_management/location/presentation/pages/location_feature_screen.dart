import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:mobeen/core/widgets/cards/custom_toggle.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';
import 'package:mobeen/features/location_management/location/presentation/cubit/location_cubit.dart';
import 'package:mobeen/features/location_management/location/presentation/cubit/location_state.dart';
import 'package:mobeen/core/widgets/buttons/custom_add_button.dart';
import 'package:mobeen/features/location_management/location/presentation/widgets/add_location_bottom_sheet.dart';
import 'package:mobeen/features/location_management/location/presentation/widgets/custom_build_list.dart';
import 'package:mobeen/features/location_management/location/presentation/widgets/custom_build_map.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/section_title.dart';
import 'package:mobeen/features/home/user_home/presentation/widgets/user_home_widget.dart';

class LocationFeatureScreen extends HookWidget {
  const LocationFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewType = useState(LocationViewType.map);
    final user = GetIt.I<UserService>().getUser;
    final userName = user?.name;

    return Scaffold(
      appBar: CustomAppBarHeader(title: "مرحبًا بك في مبين $userName"),
      body: BlocListener<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("جاري الحفظ..."),
                duration: Duration(seconds: 1),
              ),
            );
          }
          if (state is AddLocationSuccessState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("تمت الإضافة بنجاح"),
                  backgroundColor: Colors.green,
                ),
              );
            context.read<LocationCubit>().getLocations();
            Navigator.pop(context);
          }
          if (state is LocationErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                final isLoading = state is LocationLoadingState;
                final locations = state is GetLocationsSuccessState
                    ? state.locations
                    : <LocationEntity>[];
                return Column(
                  children: [
                    SectionTitle(title: 'مواقع العمل'),
                    Gap(20),
                    CustomToggle(
                      selected: LocationViewType.values,
                      onChanged: (value) {
                        viewType.value = value;
                      },
                      items: {
                        LocationViewType.map: "خريطة",
                        LocationViewType.list: "قائمة",
                      },
                    ),
                    Gap(20),
                    Expanded(
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : viewType.value == LocationViewType.map
                          ? CustomBuildMap(locations: locations)
                          : CustomBuildList(locations: locations),
                    ),
                    Gap(20),
                    CustomAddButton(
                      icon: Icons.add_location_alt_rounded,
                      title: "إضافة موقع",
                      onTap: () {
                        final cubit = context.read<LocationCubit>();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) {
                            return BlocProvider.value(
                              value: cubit,
                              child: const AddLocationBottomSheet(),
                            );
                          },
                        );
                      },
                    ),
                    Gap(20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
