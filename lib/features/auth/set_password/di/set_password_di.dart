import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'set_password_di.config.dart'; 

@InjectableInit(
  initializerName: 'initSetPassword',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/auth/set_password'],
)
void configureSetPassword(GetIt getIt) {
  getIt.initSetPassword();
}
