import 'package:angular/angular.dart';
import 'hero.dart';
import 'hero_comp.dart';
import 'hero_svc.dart';

@Component(
  selector: 'hero-list',
  templateUrl: 'hero_list_comp.html',
  styleUrls: [ 'hero_list_comp.css'],
  directives: [ coreDirectives, HeroComponent ],
  providers: [ ClassProvider(HeroService) ],
)
class HeroListComponent implements OnInit {
  //

  List<Hero> heroes;

  final HeroService _heroService;

  Hero selected;

  HeroListComponent(this._heroService);

  @override
  void ngOnInit() => _getHeroes();

  void _getHeroes() {
    _heroService.getAllSlowly().then((heroes) => this.heroes = heroes);
  }

  void onSelect(Hero hero) => selected = hero;

  //
}
