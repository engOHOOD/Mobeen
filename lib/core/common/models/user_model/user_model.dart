import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobeen/core/common/entity/user_entity.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: .snake)
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    required String role,
    required bool mustResetPassword,
    String? organisationsId,
    String? organisationName,
    String? phoneNumber,
    @JsonKey(includeIfNull: false) String? supervisorId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      role: role,
      mustResetPassword: mustResetPassword,
      organisationsId: organisationsId,
      organisationName: organisationName,
      phoneNumber: phoneNumber,
      supervisorId: supervisorId,
    );
  }
}
