import 'package:mobeen/features/home/admin_home/domain/entities/admin_home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_home_model.freezed.dart';
part 'admin_home_model.g.dart';

@freezed
abstract class AdminHomeModel with _$AdminHomeModel {
  const factory AdminHomeModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AdminHomeModel;

  factory AdminHomeModel.fromJson(Map<String, Object?> json) => _$AdminHomeModelFromJson(json);
}



extension AdminHomeModelMapper on AdminHomeModel {
  AdminHomeEntity toEntity() {
    return AdminHomeEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
