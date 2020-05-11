import 'package:pokedex/mechanics/stats_calculator.dart';

// Creates a Pokedex as an entry point for all Pokemon info
class Dex {
  List<String> pokedex;
  List<String> abilities;
  List<String> items;
  List<String> moves;
  // TypeChart
  // Stats
  // Move Calculators
  // Stat calculators
  StatsCalculator statsCalculator;

  Dex() {
    statsCalculator = StatsCalculator();

    // Load the data
  }
}
