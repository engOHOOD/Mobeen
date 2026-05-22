import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'admin_home_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAdminHome',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/home/admin_home'],
)
void configureAdminHome(GetIt getIt) {
  getIt.initAdminHome();
}
