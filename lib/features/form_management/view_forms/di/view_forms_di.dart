import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'view_forms_di.config.dart'; 

@InjectableInit(
  initializerName: 'initViewForms',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/form_management/view_forms'],
)
void configureViewForms(GetIt getIt) {
  getIt.initViewForms();
}
