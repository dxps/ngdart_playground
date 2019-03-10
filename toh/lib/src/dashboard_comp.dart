import 'package:angular/angular.dart';

import 'hero.dart';
import 'hero_svc.dart';

@Component(
  selector: 'dashboard',
  templateUrl: 'dashboard_comp.html',
  directives: [coreDirectives],
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

  //
}
