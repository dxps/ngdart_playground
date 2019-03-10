import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'hero_list_comp.template.dart' as hero_list_template;
import 'dashboard_comp.template.dart' as dashboard_template;

export 'route_paths.dart';

class Routes {
  //

  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );

  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    heroes,
    dashboard,
    // Redirection to dashboard.
    // Alternatively, it could be defined as a default route.
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];

  //
}
