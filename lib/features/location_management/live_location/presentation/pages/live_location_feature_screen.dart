import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_cubit.dart';
import 'package:mobeen/features/location_management/live_location/presentation/cubit/live_location_state.dart';

class LiveLocationFeatureScreen extends HookWidget {
  const LiveLocationFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveLocationCubit, LiveLocationState>(
        builder: (context, state) {
          if (state is LiveLocationLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LiveLocationErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is LiveLocationSuccessState) {
            final locations = state.locations;
            final markers = locations.map((loc) {
              return Marker(
                markerId: MarkerId(loc.userId),
                position: LatLng(loc.latitude ?? 0, loc.longitude ?? 0),
                infoWindow: InfoWindow(title: loc.name),
              );
            }).toSet();
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(24.7136, 46.6753),
                zoom: 12,
              ),
              markers: markers,
              zoomControlsEnabled: true,
              myLocationEnabled: false,
            );
          }
          return const Center(child: Text("لا يوجد بيانات حالياً"));
        },
    );
  }
}
