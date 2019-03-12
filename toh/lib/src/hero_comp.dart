import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_svc.dart';
import 'route_paths.dart';

@Component(
  selector: 'hero',
  templateUrl: 'hero_comp.html',
  styleUrls: ['hero_comp.css'],
  directives: [coreDirectives, formDirectives],
)
class HeroComponent implements OnActivate {
  //

  Hero hero;
  final HeroService _heroService;
  final Location _location;

  HeroComponent(this._heroService, this._location);

  void goBack() => _location.back();

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  //
}
