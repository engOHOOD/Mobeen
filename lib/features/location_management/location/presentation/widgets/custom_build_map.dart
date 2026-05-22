import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';

class CustomBuildMap extends StatelessWidget {
  const CustomBuildMap({super.key, required this.locations});
  final List<LocationEntity> locations;
 
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(24.7136, 46.6753),
        zoom: 12,
      ),
      markers: locations.map((location) {
        return Marker(
          markerId: MarkerId(location.id.toString()),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(title: location.name),
        );
      }).toSet(),
    );
  }
}
