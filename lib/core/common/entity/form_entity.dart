import 'package:equatable/equatable.dart';

class FormEntity extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String? qrCodeUrl;
  final bool isEnabled;
  final bool isCompleted;
  final int target;
  final int achieved;

  const FormEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    this.qrCodeUrl,
    required this.isEnabled,
    required this.isCompleted,
    required this.target,
    required this.achieved,
  });

  @override
  List<Object?> get props => [
    achieved,
    target,
    isCompleted,
    isEnabled,
    qrCodeUrl,
    title,
    description,
    userId,
    id,
  ];
}
