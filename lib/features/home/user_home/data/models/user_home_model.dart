import 'package:mobeen/features/home/user_home/domain/entities/user_home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_home_model.freezed.dart';
part 'user_home_model.g.dart';

@freezed
abstract class UserHomeModel with _$UserHomeModel {
  const factory UserHomeModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _UserHomeModel;

  factory UserHomeModel.fromJson(Map<String, Object?> json) => _$UserHomeModelFromJson(json);
}



extension UserHomeModelMapper on UserHomeModel {
  UserHomeEntity toEntity() {
    return UserHomeEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
