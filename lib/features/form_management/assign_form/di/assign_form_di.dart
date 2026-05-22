import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'assign_form_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAssignForm',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/form_management/assign_form'],
)
void configureAssignForm(GetIt getIt) {
  getIt.initAssignForm();
}
