import 'package:mobeen/features/location_management/live_location/domain/entities/live_location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'live_location_model.freezed.dart';
part 'live_location_model.g.dart';

@freezed
abstract class LiveLocationModel with _$LiveLocationModel {
  @JsonSerializable(fieldRename: .snake)
  const factory LiveLocationModel({
    String? id,
    required String userId,
    String? name,
    double? latitude,
    double? longitude,
    DateTime? updatedAt,
  }) = _LiveLocationModel;

  factory LiveLocationModel.fromJson(Map<String, Object?> json) =>
      _$LiveLocationModelFromJson(json);
}

extension LiveLocationModelMapper on LiveLocationModel {
  LiveLocationEntity toEntity() {
    return LiveLocationEntity(
      id: id,
      userId: userId,
      name:name,
      latitude: latitude,
      longitude: longitude,
      updatedAt: updatedAt,
    );
  }
}

extension LiveLocationEntityMapper on LiveLocationEntity {
  LiveLocationModel toModel() {
    return LiveLocationModel(
      userId: userId,
      latitude: latitude,
      longitude: longitude,
      updatedAt: updatedAt,
    );
  }
}
