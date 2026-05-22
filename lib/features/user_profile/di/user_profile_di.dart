import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'user_profile_di.config.dart'; 

@InjectableInit(
  initializerName: 'initUserProfile',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/user_profile'],
)
void configureUserProfile(GetIt getIt) {
  getIt.initUserProfile();
}
