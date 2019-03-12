import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_svc.dart';
import 'route_paths.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard_comp.html',
  styleUrls: ['dashboard_comp.css'],
  directives: [coreDirectives, routerDirectives],
)
class DashboardComponent implements OnInit {
  //

  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  //
}
