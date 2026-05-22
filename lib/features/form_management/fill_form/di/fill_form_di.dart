import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'fill_form_di.config.dart'; 

@InjectableInit(
  initializerName: 'initFillForm',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/form_management/fill_form'],
)
void configureFillForm(GetIt getIt) {
  getIt.initFillForm();
}
