import 'package:pokedex/pokemon/pokemon.dart';
import 'package:pokedex/pokemon/stat.dart';

class StatsCalculator {
  /// Calculates a stat for the given Pokemon set
  static int calculateStat(Pokemon pkmn, Stat stat) {
    if (stat == Stat.HP) return calculateHP(pkmn);

    var baseStat = pkmn.species.baseStats[stat];
    var nature = 1;

    return ((((baseStat * 2 +
                            pkmn.ivs[Stat.HP] +
                            (pkmn.evs[Stat.HP] / 4).floor()) *
                        pkmn.level /
                        100)
                    .floor() +
                5) *
            nature)
        .floor();
  }

  /// Calculates the (maximum) HP for a given Pokemon set
  static int calculateHP(Pokemon pkmn) {
    var baseStat = pkmn.species.baseStats[Stat.HP];

    // Deal with Shedinja
    if (baseStat == 1) {
      return 1;
    } else {
      return ((baseStat * 2 +
                      pkmn.ivs[Stat.HP] +
                      (pkmn.evs[Stat.HP] / 4).floor()) *
                  pkmn.level /
                  100)
              .floor() +
          pkmn.level +
          10;
    }
  }
}
