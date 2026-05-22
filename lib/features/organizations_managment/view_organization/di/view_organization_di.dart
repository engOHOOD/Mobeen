import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'view_organization_di.config.dart'; 

@InjectableInit(
  initializerName: 'initViewOrganization',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/organizations_managment/view_organization'],
)
void configureViewOrganization(GetIt getIt) {
  getIt.initViewOrganization();
}
