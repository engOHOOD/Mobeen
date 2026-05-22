import 'package:mobeen/core/common/entity/form_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class ViewFormsRepositoryDomain {
   Future<Result<List<FormEntity>, Failure>> getViewForms();
}
