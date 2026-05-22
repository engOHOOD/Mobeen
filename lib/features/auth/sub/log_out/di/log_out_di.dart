import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'log_out_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLogOutSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/auth/sub/log_out'],
)
void configureLogOutSub(GetIt getIt) {
  getIt.initLogOutSub();
}
