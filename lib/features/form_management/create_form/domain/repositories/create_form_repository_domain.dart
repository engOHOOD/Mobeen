import 'package:mobeen/core/common/entity/add_question.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/failure.dart';

abstract class CreateFormRepositoryDomain {
  Future<Result<void, Failure>> createForm({
    required String title,
    required String description,
    required int target,
    required List<AddQuestion> questions,
  });
}
