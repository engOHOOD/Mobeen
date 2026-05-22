import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'log_in_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLogIn',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/auth/log_in'],
)
void configureLogIn(GetIt getIt) {
  getIt.initLogIn();
}
