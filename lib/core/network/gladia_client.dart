import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/network/api_endpoints.dart';
import 'package:mobeen/core/network/dio_client.dart';

@lazySingleton
class GladiaClient  {
  final DioClient dioClient;

  GladiaClient(this.dioClient);
  
  Future<String> uploadAudio({required File file}) async {
    FormData formData = FormData.fromMap({
      "audio": await MultipartFile.fromFile(file.path),
    });

    final response = await dioClient.dio.post(
      ApiEndpoints.uploadEndPoint,
      options: Options(headers: {"Content-Type": 'multipart/form-data'}),
      data: formData,
    );

    return response.data['audio_url'];
  }

  Future<String> startTranscription({required String audioUrl}) async {
    final response = await dioClient.dio.post(
      ApiEndpoints.preRecordedEndPoint,
      data: {'audio_url': audioUrl},
    );

    return response.data['id'];
  }

  Future<Map<String, dynamic>> getTranscriptionResult({required String transcriptionId}) async {
    late Response response;
    do {
      response = await dioClient.dio.get("${ApiEndpoints.preRecordedEndPoint}/$transcriptionId");
      await Future.delayed(Duration(seconds: 2));
    } while (response.data['status'] != 'done');

    return response.data["result"];
  }
}