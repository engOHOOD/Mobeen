
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:mobeen/features/translate/domain/entities/translate_entity.dart';

import 'package:mobeen/features/translate/data/datasources/translate_remote_data_source.dart';
import 'package:mobeen/features/translate/data/models/translate_model.dart';
import 'package:mobeen/features/translate/domain/repositories/translate_repository_domain.dart';

@LazySingleton(as: TranslateRepositoryDomain)
class TranslateRepositoryData implements TranslateRepositoryDomain{
  final BaseTranslateRemoteDataSource remoteDataSource;


  TranslateRepositoryData(this.remoteDataSource);

@override
  Future<Result<bool, Failure>> startRecording() async {
    try {
      await remoteDataSource.startRecording();
      return Success(true);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

   @override
  Future<Result<TranslateEntity, Failure>> stopRecording() async {
    try {
      final response = await remoteDataSource.stopRecording();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
   @override
  Future<Result<TranslateEntity, Failure>> sendText(String text) async {
    try {
      final response = await remoteDataSource.sendText(text);
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<void, Failure>> resetSession() async {
   try {
      await remoteDataSource.resetSession();
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
