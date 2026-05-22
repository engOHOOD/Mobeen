import 'package:equatable/equatable.dart';

class FillFormEntity extends Equatable {
  final String id;
  final String formId;
  final String questionId;
  final String userId;
  final List<dynamic> answer;

  const FillFormEntity({
    required this.id,
    required this.formId,
    required this.questionId,
    required this.userId,
    required this.answer,
  });

  @override
  List<Object?> get props => [answer, userId, questionId, formId, id];
}
