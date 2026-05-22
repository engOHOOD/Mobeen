import 'package:mobeen/core/constants/app_enums.dart';
import 'package:mobeen/features/location_management/location/domain/entities/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
abstract class LocationModel with _$LocationModel {
  @JsonSerializable(fieldRename: .snake)
  const factory LocationModel({
    @JsonKey(includeIfNull: false)
    String? id,
    String? name,
    String? nationalAddress,
    required double latitude,
    required double longitude,
    required LocationStatus status,
    String? hajjCode,
    String? hajjNationality,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, Object?> json) =>
      _$LocationModelFromJson(json);
}

extension LocationModelMapper on LocationModel {
  LocationEntity toEntity() {
    return LocationEntity(
      id: id,
      name: name,
      nationalAddress: nationalAddress,
      latitude: latitude,
      longitude: longitude,
      status: status,
      hajjCode:hajjCode,
      hajjNationality:hajjNationality
    );
  }
}
extension LocationEntityMapper on LocationEntity {
  LocationModel toModel() {
    return LocationModel(
      name: name,
      nationalAddress: nationalAddress,
      latitude: latitude,
      longitude: longitude,
      status: status,
      hajjCode:hajjCode,
      hajjNationality:hajjNationality
    );
  }
}