import 'package:enum_to_string/enum_to_string.dart';
import 'package:pokedex/pokemon/type.dart';

class Move {
  final String id;
  final int number;
  final String name;
  final PokemonType type;
  final int basePower;
  final String description;

  const Move({
    this.id,
    this.number,
    this.name,
    this.type,
    this.basePower,
    this.description,
  });

  factory Move.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to Move");
    }

    return Move(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      type: EnumToString.fromString(PokemonType.values, json['type']) ??
          PokemonType.Unknown,
      basePower: json['basePower'],
      description: json['shortDesc'] ?? 'No description',
    );
  }
}
