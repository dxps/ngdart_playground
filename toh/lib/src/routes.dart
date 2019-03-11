import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'dashboard_comp.template.dart' as dashboard_template;
import 'hero_list_comp.template.dart' as hero_list_template;
import 'hero_comp.template.dart' as hero_template;

export 'route_paths.dart';

class Routes {
  //

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );

  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    dashboard,
    heroes,
    hero,

    // Redirection to dashboard.
    // Alternatively, it could be defined as a default route.
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];

  //
}
