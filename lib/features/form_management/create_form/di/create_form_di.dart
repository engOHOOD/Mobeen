import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'create_form_di.config.dart'; 

@InjectableInit(
  initializerName: 'initCreateForm',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/form_management/create_form'],
)
void configureCreateForm(GetIt getIt) {
  getIt.initCreateForm();
}
