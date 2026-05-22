import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'user_home_di.config.dart'; 

@InjectableInit(
  initializerName: 'initUserHome',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/home/user_home'],
)
void configureUserHome(GetIt getIt) {
  getIt.initUserHome();
}
