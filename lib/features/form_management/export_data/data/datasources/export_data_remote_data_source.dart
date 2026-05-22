import 'dart:io';

import 'package:excel/excel.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/common/models/form_model/form_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';
import 'package:mobeen/core/services/local_keys_service.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseExportDataRemoteDataSource {
  Future<List<FormModel>> getExportData();

  Future<void> exportSelectedForms({
    required List<String> forms,
    required DateTime fromDate,
    required DateTime toDate,
  });
}

@LazySingleton(as: BaseExportDataRemoteDataSource)
class ExportDataRemoteDataSource implements BaseExportDataRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalKeysService _localKeysService;

  ExportDataRemoteDataSource(
    this._userService,
    this._supabase,
    this._localKeysService,
  );

  // ─────────────────────────────────────────────
  // GET FORMS
  // ─────────────────────────────────────────────

  @override
  Future<List<FormModel>> getExportData() async {
    try {
      final orgId = _userService.getUser?.organisationsId;

      if (orgId == null) {
        throw Exception("User organisation not found");
      }

      final response = await _supabase
          .from('forms')
          .select()
          .eq('organisation_id', orgId);

      final List data = response as List;

      return data.map((e) => FormModel.fromJson(e)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // ─────────────────────────────────────────────
  // EXPORT EXCEL
  // ─────────────────────────────────────────────

  @override
  Future<void> exportSelectedForms({
    required List<String> forms,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      if (forms.isEmpty) {
        throw Exception("No forms selected.");
      }

      // FETCH JOINED DATA

      final response = await _supabase
          .from('form_answers')
          .select('''
                *,
                forms(*),
                questions(*)
              ''')
          .eq('form_id', forms.first)
          .gte('created_at', fromDate.toIso8601String())
          .lte('created_at', toDate.toIso8601String());

      final List data = response as List;

      // CREATE EXCEL

      final excel = Excel.createExcel();

      final sheetName = excel.getDefaultSheet() ?? 'Sheet1';

      final sheet = excel[sheetName];

      // HEADERS

      sheet.appendRow([
        TextCellValue('Answer ID'),

        TextCellValue('Form Title'),

        TextCellValue('Question'),

        TextCellValue('Answer'),

        TextCellValue('Created At'),
      ]);

      // ROWS

      for (final item in data) {
        final row = item as Map<String, dynamic>;

        final form = row['forms'] as Map<String, dynamic>?;

        final question = row['questions'] as Map<String, dynamic>?;

        sheet.appendRow([
          TextCellValue(row['id']?.toString() ?? ''),

          TextCellValue(form?['title']?.toString() ?? ''),

          TextCellValue(question?['question']?.toString() ?? ''),

          TextCellValue(row['answer']?.toString() ?? ''),

          TextCellValue(row['created_at']?.toString() ?? ''),
        ]);
      }

      // GENERATE FILE

      final bytes = excel.encode();

      if (bytes == null) {
        throw Exception("Failed generating file");
      }

      // SAVE

      final dir = await getApplicationDocumentsDirectory();

      final path =
          '${dir.path}/export_${DateTime.now().millisecondsSinceEpoch}.xlsx';

      final file = File(path);

      await file.writeAsBytes(bytes);

      // SHARE

      await SharePlus.instance.share(ShareParams(files: [XFile(path)]));
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
