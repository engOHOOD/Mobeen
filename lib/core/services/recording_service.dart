import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/errors/failure.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/v7.dart';

@lazySingleton
class RecordingService {
  final _record = AudioRecorder();

  Future<void> requestPermission() async {
    final hasPermission = await _record.hasPermission(request: true);
    if (!hasPermission) {
      throw PermissionFailure("record not allow");
    }
  }

  Future<void> startRecording() async {
    await requestPermission();

    final Directory tempDir = await getTemporaryDirectory();
    final name = UuidV7().generate();

    await _record.start(
      const RecordConfig(),
      path: '${tempDir.path}/$name.m4a',
    );
  }

  Future<String?> stopRecording() async {
    
    final path = await _record.stop();
   
    if (path == null) return null;

    final file = File(path);

    final exists = await file.exists();
    if (!exists) {
      throw FileSystemException("Recording file not created");
    }

    return path;
  }
}
