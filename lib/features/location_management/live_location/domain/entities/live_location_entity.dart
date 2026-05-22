import 'package:equatable/equatable.dart';

class LiveLocationEntity extends Equatable {
  final String? id;
  final String userId;
  final String? name;
  final double? latitude;
  final double? longitude;
  final DateTime? updatedAt;

  const LiveLocationEntity({
    this.id,
    required this.userId,
    this.name,
    this.latitude,
    this.longitude,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, name, latitude, longitude, updatedAt];
}
