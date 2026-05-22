
import 'package:equatable/equatable.dart';
import 'package:mobeen/core/constants/app_enums.dart';

class AddQuestion extends Equatable {
  final String id;

  String label;

  QuestionType type;

  bool required;

  List<String> options;

  AddQuestion({
    required this.id,
    required this.label,
    required this.type,
    this.required = false,
    this.options = const [],
  });

  @override
  List<Object?> get props => [id, label, type, required, options];
}