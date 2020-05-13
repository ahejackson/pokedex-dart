import 'package:enum_to_string/enum_to_string.dart';
import 'package:pokedex/pokemon/stat.dart';
import 'package:pokedex/pokemon/type.dart';

class Species {
  final String id;
  final int number;
  final String name;
  final List<PokemonType> types;
  final Map<Stat, int> baseStats;

  const Species({
    this.id,
    this.number,
    this.name,
    this.types,
    this.baseStats,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to Species");
    }

    print(json['types'].runtimeType);

    return Species(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      types: json['types']
          .map<PokemonType>((typeString) => EnumToString.fromString(
              PokemonType.values, typeString.toString()))
          .toList(),
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
