import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'export_data_di.config.dart'; 

@InjectableInit(
  initializerName: 'initExportData',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/form_management/export_data'],
)
void configureExportData(GetIt getIt) {
  getIt.initExportData();
}
