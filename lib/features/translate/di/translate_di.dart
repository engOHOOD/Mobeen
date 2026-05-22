import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'translate_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTranslate',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/translate'],
)
void configureTranslate(GetIt getIt) {
  getIt.initTranslate();
}
