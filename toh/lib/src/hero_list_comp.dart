import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_svc.dart';
import 'route_paths.dart';

@Component(
  selector: 'hero-list',
  templateUrl: 'hero_list_comp.html',
  styleUrls: ['hero_list_comp.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
  providers: [ClassProvider(HeroService)],
)
class HeroListComponent implements OnInit {
  //

  final HeroService _heroService;
  final Router _router;

  List<Hero> heroes;
  Hero selected;

  HeroListComponent(this._heroService, this._router);

  Future<NavigationResult> gotoDetail() => _router.navigate(
        RoutePaths.hero.toUrl(
          parameters: {idParam: '${selected.id}'},
        ),
      );

  @override
  void ngOnInit() => _getHeroes();

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void onSelect(Hero hero) => selected = hero;

  Future<void> add(String name) async {
    //
    name = name.trim();
    if (name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
    //
  }

  Future<void> delete(Hero hero) async {
    //
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selected == hero) selected = null;
    //
  }

  //
}
