import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String id;
  final String formId;
  String question;
  String type;
  bool isRequired;
  List<String> options;
  final int sort;

  QuestionEntity({
    required this.id,
    required this.formId,
    required this.question,
    required this.type,
    this.isRequired = false,
    this.options = const [],
    required this.sort,
  });

  @override
  List<Object?> get props => [id, question, type, isRequired, options];
}
