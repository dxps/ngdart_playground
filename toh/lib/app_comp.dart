import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/hero_svc.dart';
import 'src/routes.dart';

/*
 AppComponent has a router and displays routed views.
 For this reason, this component type is called a router component
 (and to distinguish it from other kinds of components),
*/

@Component(
  selector: 'app-comp',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="RoutePaths.dashboard.toUrl()" [routerLinkActive]="'active'">Dashboard</a>
      <a [routerLink]="RoutePaths.heroes.toUrl()"    [routerLinkActive]="'active'">Heroes</a>
    </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_comp.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  //

  final title = 'Tour of Heroes';

  //
}
