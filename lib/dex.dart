import 'dart:collection';

import 'package:pokedex/mechanics/stats_calculator.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex/pokemon/ability.dart';
import 'package:pokedex/pokemon/item.dart';
import 'package:pokedex/pokemon/move.dart';
import 'package:pokedex/pokemon/species.dart';

// Creates a Pokedex as an entry point for all Pokemon info
class Dex {
  final Map<String, Species> _pokedex = {};
  final Map<String, Ability> _abilities = {};
  final Map<String, Item> _items = {};
  final Map<String, Move> _moves = {};
  // TypeChart
  // Stats
  // Move Calculators
  StatsCalculator statsCalculator;

  Dex() {
    statsCalculator = StatsCalculator();
  }

  Future<Null> init() async {
    print('Loading Dex');
    Future.wait([
      initAbilities(),
      initItems(),
      initMoves(),
      initPokedex(),
    ]);
    print('Dex Loaded');
  }

  // Intialisation Methods
  Future<Null> initAbilities() async {
    final abilityList = await loadAbilities();
    abilityList.forEach((ability) => _abilities[ability.id] = ability);
  }

  Future<Null> initItems() async {
    final itemList = await loadItems();
    itemList.forEach((item) => _items[item.id] = item);
  }

  Future<Null> initMoves() async {
    final moveList = await loadMoves();
    moveList.forEach((move) => _moves[move.id] = move);
  }

  Future<Null> initPokedex() async {
    final speciesList = await loadPokedex();
    speciesList.forEach((species) => _pokedex[species.id] = species);
  }

  // GETTERS
  Ability getAbility(String id) {
    return _abilities[id];
  }

  List<Ability> getAbilities() {
    return UnmodifiableListView(_abilities.values);
  }

  Item getItem(String id) {
    return _items[id];
  }

  List<Item> getItems() {
    return UnmodifiableListView(_items.values);
  }

  Move getMove(String id) {
    return _moves[id];
  }

  List<Move> getMoves() {
    return UnmodifiableListView(_moves.values);
  }

  Species getSpecies(String id) {
    return _pokedex[id];
  }

  List<Species> getPokedex() {
    return UnmodifiableListView(_pokedex.values);
  }
}
