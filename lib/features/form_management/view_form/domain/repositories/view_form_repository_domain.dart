import 'package:mobeen/core/common/entity/question_entity.dart';
import 'package:mobeen/core/common/models/question_model/question_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/form_management/view_form/domain/entities/view_form_entity.dart';

abstract class ViewFormRepositoryDomain {
     Future<Result<List<QuestionEntity>, Failure>> getViewForm({required String formId});
}
