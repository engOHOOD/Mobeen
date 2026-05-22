import 'package:mobeen/features/organizations_managment/view_organization/domain/entities/view_organization_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_organization_model.freezed.dart';
part 'view_organization_model.g.dart';

@freezed
abstract class ViewOrganizationModel with _$ViewOrganizationModel {
  const factory ViewOrganizationModel({
    required String id,
    required String name,
    required String email,
    @JsonKey(name: 'national_address') required String? nationalAddress,

    @JsonKey(name: 'organization_logo') required String? organizationLogo,
  }) = _ViewOrganizationModel;

  factory ViewOrganizationModel.fromJson(Map<String, Object?> json) =>
      _$ViewOrganizationModelFromJson(json);
}

extension ViewOrganizationModelMapper on ViewOrganizationModel {
  ViewOrganizationEntity toEntity() {
    return ViewOrganizationEntity(
      id: id,
      name: name,
      email: email,
      nationalAddress: nationalAddress,
      organizationLogo: organizationLogo,
    );
  }
}
