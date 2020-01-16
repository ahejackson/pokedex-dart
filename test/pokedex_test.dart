import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/pokedex.dart';
import 'package:pokedex/models/pokemon_set.dart';

var paste =
    "Hm yes (Mimikyu) @ Life Orb  \r\nAbility: Disguise  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Play Rough  \r\n- Shadow Sneak  \r\n- Trick Room  \r\n- Will-O-Wisp  \r\n\r\nclearly made (Braviary) (M) @ Lum Berry  \r\nAbility: Defiant  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Brave Bird  \r\n- Close Combat  \r\n- Protect  \r\n- Tailwind  \r\n\r\nThe floor is (Excadrill) @ Focus Sash  \r\nAbility: Mold Breaker  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Earthquake  \r\n- High Horsepower  \r\n- Iron Head  \r\n- Protect  \r\n\r\nBuzz (Rotom-Heat) @ Sitrus Berry  \r\nAbility: Levitate  \r\nLevel: 50  \r\nEVs: 252 HP / 4 Def / 180 SpA / 4 SpD / 68 Spe  \r\nModest Nature  \r\nIVs: 0 Atk  \r\n- Overheat  \r\n- Thunderbolt  \r\n- Will-O-Wisp  \r\n- Helping Hand  \r\n\r\nOut of floor (Dracovish) @ Choice Scarf  \r\nAbility: Strong Jaw  \r\nLevel: 50  \r\nEVs: 92 HP / 156 Atk / 4 Def / 4 SpD / 252 Spe  \r\nAdamant Nature  \r\n- Fishious Rend  \r\n- Dragon Rush  \r\n- Ice Fang  \r\n- Stomping Tantrum  \r\n\r\nTyranitar @ Weakness Policy  \r\nAbility: Sand Stream  \r\nLevel: 50  \r\nEVs: 252 HP / 204 Atk / 4 Def / 12 SpD / 36 Spe  \r\nAdamant Nature  \r\n- Rock Slide  \r\n- Crunch  \r\n- Superpower  \r\n- Protect  \r\n\r\n";

void main() {
  // Split the paste into sets (seperated by a double new line")
  List<PokemonSet> sets = parsePaste(paste);
  for (PokemonSet set in sets) {
    print(set);
  }

/*  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });*/
}
