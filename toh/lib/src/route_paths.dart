import 'package:angular_router/angular_router.dart';

/// ID param considered in '/heroes/:id' routes.
const idParam = 'id';

///
///
///
class RoutePaths {
  //

  static final heroes = RoutePath(path: 'heroes');

  static final dashboard = RoutePath(path: 'dashboard');

  // ':id' is a placeholder for a specific hero ID when navigating to hero details.
  static final hero = RoutePath(path: '${heroes.path}/:$idParam');

  //
}

/// Helper function that extracts the id from the `RouterState.parameters` map.
int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
