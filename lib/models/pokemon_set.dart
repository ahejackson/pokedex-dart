import './pokemon_gender.dart';

class PokemonSet {
  String name;
  String form;
  String nickname;
  PokemonGender gender;
  String item;
  String ability;
  bool shiny = false;
  int level = 50;
  int happiness = 255;
  String nature = "Hardy";
  List<String> moves = new List();
  List<String> notes = new List();

  PokemonSet(
      {this.name, this.form, this.item, this.ability, this.nature, this.notes});

  @override
  String toString() {
    return "$name @ $item ($nature, $ability)";
  }
}
