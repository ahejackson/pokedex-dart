import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pokedex/pokemon/ability.dart';
import 'package:pokedex/pokemon/item.dart';
import 'package:pokedex/pokemon/move.dart';
import 'package:pokedex/pokemon/species.dart';

Future<List<Ability>> loadAbilities() async {
  final jsonString =
      await rootBundle.loadString('packages/pokedex/data/abilities.json');
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Ability>((ability) => Ability.fromJson(ability)).toList();
}

Future<List<Item>> loadItems() async {
  final jsonString =
      await rootBundle.loadString('packages/pokedex/data/items.json');
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Item>((item) => Item.fromJson(item)).toList();
}

Future<List<Move>> loadMoves() async {
  final jsonString =
      await rootBundle.loadString('packages/pokedex/data/moves.json');
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Move>((move) => Move.fromJson(move)).toList();
}

Future<List<Species>> loadPokedex() async {
  final jsonString =
      await rootBundle.loadString('packages/pokedex/data/pokedex.json');
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Species>((species) => Species.fromJson(species)).toList();
}
