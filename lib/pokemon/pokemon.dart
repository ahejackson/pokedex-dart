import 'package:pokedex/mechanics/stats_calculator.dart';
import 'package:pokedex/pokemon/gender.dart';
import 'package:pokedex/pokemon/nature.dart';
import 'package:pokedex/pokemon/species.dart';
import 'package:pokedex/pokemon/stat.dart';

class Pokemon {
  String name;
  String form;
  String nickname;
  Gender gender;
  String item;
  String ability;
  bool shiny = false;
  int level = 50;
  int happiness = 255;

  Species species;
  Nature nature = Nature.Hardy;

  // IVs
  var ivs = {
    Stat.HP: 31,
    Stat.Attack: 31,
    Stat.Defense: 31,
    Stat.SpecialAttack: 31,
    Stat.SpecialDefense: 31,
    Stat.Speed: 31,
  };

  // EVs
  var evs = {
    Stat.HP: 0,
    Stat.Attack: 0,
    Stat.Defense: 0,
    Stat.SpecialAttack: 0,
    Stat.SpecialDefense: 0,
    Stat.Speed: 0,
  };

  // Moves
  List<String> moves = new List();

  // Notes
  List<String> notes = new List();

  Pokemon({
    this.name,
    this.form,
    this.item,
    this.ability,
    this.nature,
    this.notes,
  });

  // Stat Getters
  int get hp {
    return StatsCalculator.calculateHP(this);
  }

  int get attack {
    return StatsCalculator.calculateStat(this, Stat.Attack);
  }

  int get defense {
    return StatsCalculator.calculateStat(this, Stat.Defense);
  }

  int get specialAttack {
    return StatsCalculator.calculateStat(this, Stat.SpecialAttack);
  }

  int get specialDefense {
    return StatsCalculator.calculateStat(this, Stat.SpecialDefense);
  }

  int get speed {
    return StatsCalculator.calculateStat(this, Stat.Speed);
  }

  @override
  String toString() {
    return "$name @ $item ($nature, $ability)";
  }
}
