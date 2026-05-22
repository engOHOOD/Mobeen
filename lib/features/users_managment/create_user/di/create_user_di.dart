import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'create_user_di.config.dart'; 

@InjectableInit(
  initializerName: 'initCreateUser',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/users_managment/create_user'],
)
void configureCreateUser(GetIt getIt) {
  getIt.initCreateUser();
}
