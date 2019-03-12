import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';

import 'package:toh/app_comp.template.dart' as ng;
import 'package:toh/in_memory_data_service.dart';
import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production.
  // ClassProvider(BrowserClient), // It has the same effect as the `providers` list in `@Component` annotation.
  ClassProvider(Client, useClass: InMemoryDataService),
  // If using a real back end, then do:
  //    import 'package:http/browser_client.dart'
  // and change the above to:
  //    ClassProvider(Client, useClass: BrowserClient),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  //
  runApp(ng.AppComponentNgFactory, createInjector: injector);
  //
}
