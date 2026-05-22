import 'package:equatable/equatable.dart';

class ViewOrganizationEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? nationalAddress;
  final String? organizationLogo;

  const ViewOrganizationEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.nationalAddress,
    required this.organizationLogo
  });

  @override
  List<Object?> get props => [id, name, email, nationalAddress,organizationLogo];
}
