import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'tasks_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTasks',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/tasks'],
)
void configureTasks(GetIt getIt) {
  getIt.initTasks();
}
