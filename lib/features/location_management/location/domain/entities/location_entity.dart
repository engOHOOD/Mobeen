import 'package:equatable/equatable.dart';
import 'package:mobeen/core/constants/app_enums.dart';

class LocationEntity extends Equatable {
  final String? id;
  final String? name;
  final String? nationalAddress;
  final double latitude;
  final double longitude;
  final LocationStatus status;
  final String? hajjCode;
  final String? hajjNationality;

  const LocationEntity({
    this.id,
    this.name,
    this.nationalAddress,
    required this.latitude,
    required this.longitude,
    required this.status,
    this.hajjCode,
    this.hajjNationality,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    nationalAddress,
    latitude,
    longitude,
    status,
    hajjCode,
    hajjNationality,
  ];
}
