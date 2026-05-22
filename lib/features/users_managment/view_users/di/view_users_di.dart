import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'view_users_di.config.dart'; 

@InjectableInit(
  initializerName: 'initViewUsers',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/users_managment/view_users'],
)
void configureViewUsers(GetIt getIt) {
  getIt.initViewUsers();
}
