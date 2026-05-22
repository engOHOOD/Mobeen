import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'live_team_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLiveTeam',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/live_team'],
)
void configureLiveTeam(GetIt getIt) {
  getIt.initLiveTeam();
}
