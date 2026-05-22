import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'location_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLocation',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/location_management/location'],
)
void configureLocation(GetIt getIt) {
  getIt.initLocation();
}
