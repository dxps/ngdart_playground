import 'dart:async';
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

  final HeroService _heroService;
  final Location _location;
  Hero hero;

  HeroComponent(this._heroService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  void goBack() => _location.back();

  Future<void> save() async {
    await _heroService.update(hero);
    goBack();
  }

  //
}
