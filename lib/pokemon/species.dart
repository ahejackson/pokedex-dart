import 'package:pokedex/pokemon/stat.dart';

class Species {
  final String id;
  final int number;
  final String name;
  final Map<Stat, int> baseStats;

  const Species({
    this.id,
    this.number,
    this.name,
    this.baseStats,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to Species");
    }

    return Species(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      baseStats: {
        Stat.HP: json['baseStats']['hp'],
        Stat.Attack: json['baseStats']['atk'],
        Stat.Defense: json['baseStats']['def'],
        Stat.SpecialAttack: json['baseStats']['spa'],
        Stat.SpecialDefense: json['baseStats']['spd'],
        Stat.Speed: json['baseStats']['spe'],
      },
    );
  }
}
