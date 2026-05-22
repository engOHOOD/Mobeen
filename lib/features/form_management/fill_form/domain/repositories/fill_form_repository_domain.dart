import 'package:mobeen/features/form_management/fill_form/domain/entities/fill_form_entity.dart';
import 'package:mobeen/features/form_management/fill_form/domain/entities/generate_form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class FillFormRepositoryDomain {
  Future<Result<GenerateFormEntity, Failure>> getForm({required String formId});
  Future<Result<void, Failure>> submit({required  List<FillFormEntity> submitAnswers});
}
