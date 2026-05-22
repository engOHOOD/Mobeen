import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'live_location_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLiveLocation',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/location_management/live_location'],
)
void configureLiveLocation(GetIt getIt) {
  getIt.initLiveLocation();
}
