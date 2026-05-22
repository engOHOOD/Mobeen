import 'package:equatable/equatable.dart';
import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:mobeen/core/common/entity/question_entity.dart';

class GenerateFormEntity extends Equatable {
  final FormEntity form;
  final List<QuestionEntity> questions;

  const GenerateFormEntity({required this.form, required this.questions});

  @override
  List<Object?> get props => [form, questions];
}
