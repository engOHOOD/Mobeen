import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'view_form_di.config.dart'; 

@InjectableInit(
  initializerName: 'initViewForm',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/form_management/view_form'],
)
void configureViewForm(GetIt getIt) {
  getIt.initViewForm();
}
