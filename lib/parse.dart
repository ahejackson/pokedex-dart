import 'dart:convert' show HtmlEscape;

var paste =
    "Hm yes (Mimikyu) @ Life Orb  \r\nAbility: Disguise  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Play Rough  \r\n- Shadow Sneak  \r\n- Trick Room  \r\n- Will-O-Wisp  \r\n\r\nclearly made (Braviary) (M) @ Lum Berry  \r\nAbility: Defiant  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Brave Bird  \r\n- Close Combat  \r\n- Protect  \r\n- Tailwind  \r\n\r\nThe floor is (Excadrill) @ Focus Sash  \r\nAbility: Mold Breaker  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Earthquake  \r\n- High Horsepower  \r\n- Iron Head  \r\n- Protect  \r\n\r\nBuzz (Rotom-Heat) @ Sitrus Berry  \r\nAbility: Levitate  \r\nLevel: 50  \r\nEVs: 252 HP / 4 Def / 180 SpA / 4 SpD / 68 Spe  \r\nModest Nature  \r\nIVs: 0 Atk  \r\n- Overheat  \r\n- Thunderbolt  \r\n- Will-O-Wisp  \r\n- Helping Hand  \r\n\r\nOut of floor (Dracovish) @ Choice Scarf  \r\nAbility: Strong Jaw  \r\nLevel: 50  \r\nEVs: 92 HP / 156 Atk / 4 Def / 4 SpD / 252 Spe  \r\nAdamant Nature  \r\n- Fishious Rend  \r\n- Dragon Rush  \r\n- Ice Fang  \r\n- Stomping Tantrum  \r\n\r\nTyranitar @ Weakness Policy  \r\nAbility: Sand Stream  \r\nLevel: 50  \r\nEVs: 252 HP / 204 Atk / 4 Def / 12 SpD / 36 Spe  \r\nAdamant Nature  \r\n- Rock Slide  \r\n- Crunch  \r\n- Superpower  \r\n- Protect  \r\n\r\n";
//var paste =
//    "Hm yes (Mimikyu) @ Life Orb  \r\nAbility: Disguise  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Play Rough  \r\n- Shadow Sneak  \r\n- Trick Room  \r\n- Will-O-Wisp  \r\n\r\nclearly made (Braviary) (M) @ Lum Berry  \r\nAbility: Defiant  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Brave Bird  \r\n- Close Combat  \r\n- Protect  \r\n- Tailwind  \r\n\r\nThe floor is (Excadrill) @ Focus Sash  \r\nAbility: Mold Breaker  \r\nLevel: 50  \r\nEVs: 4 HP / 252 Atk / 252 Spe  \r\nJolly Nature  \r\n- Earthquake  \r\n- High Horsepower  \r\n- Iron Head  \r\n- Protect  \r\n\r\nBuzz (Rotom-Heat) @ Sitrus Berry  \r\nAbility: Levitate  \r\nLevel: 50  \r\nEVs: 252 HP / 4 Def / 180 SpA / 4 SpD / 68 Spe  \r\nModest Nature  \r\nIVs: 0 Atk  \r\n- Overheat  \r\n- Thunderbolt  \r\n- Will-O-Wisp  \r\n- Helping Hand  \r\n\r\nOut of floor (Dracovish) @ Choice Scarf  \r\nAbility: Strong Jaw  \r\nLevel: 50  \r\nEVs: 92 HP / 156 Atk / 4 Def / 4 SpD / 252 Spe  \r\nAdamant Nature  \r\n- Fishious Rend  \r\n- Dragon Rush  \r\n- Ice Fang  \r\n- Stomping Tantrum  \r\n\r\nTyranitar @ Weakness Policy  \r\nAbility: Sand Stream  \r\nLevel: 50  \r\nEVs: 252 HP / 204 Atk / 4 Def / 12 SpD / 36 Spe  \r\nAdamant Nature  \r\n- Rock Slide  \r\n- Crunch  \r\n- Superpower  \r\n- Protect  \r\n\r\n";

RegExp reHead = new RegExp(
    r"^(?:(.* \()([A-Z][a-z0-9:']+\.?(?:[- ][A-Za-z][a-z0-9:']*\.?)*)(\))|([A-Z][a-z0-9:']+\.?(?:[- ][A-Za-z][a-z0-9:']*\.?)*))(?:( \()([MF])(\)))?(?:( @ )([A-Z][a-z0-9:']*(?:[- ][A-Z][a-z0-9:']*)*))?( *)$");
RegExp reMove = new RegExp(
    r"^(-)( ([A-Z][a-z\']*(?:[- ][A-Za-z][a-z\']*)*)(?: \[([A-Z][a-z]+)\])?(?: / [A-Z][a-z\']*(?:[- ][A-Za-z][a-z\']*)*)* *)$");
RegExp reNature = new RegExp(r"^([A-Z][a-z]+)?(?: Nature)(?: *)$");
RegExp reStats = new RegExp(
    r"^(\d+ HP)?( / )?(\d+ Atk)?( / )?(\d+ Def)?( / )?(\d+ SpA)?( / )?(\d+ SpD)?( / )?(\d+ Spe)?( *)$");

void main() {
  // Split the paste into sets (seperated by a double new line")
  var sets = paste.split("\r\n\r\n");

  for (String set in sets) {
    print(parseSet(set));
  }
}

// Parse a string into a Pokemon Set
dynamic parseSet(String set) {
  if (set.length == 0) return null;

  var sanitizer = const HtmlEscape();
  String name;
  String nickname = "";
  String gender = "-";
  String item = "";
  String ability = "";
  bool shiny = false;
  int level = 50;
  int happiness = 255;
  String nature = "Hardy";
  List<String> moves = new List();
  List<String> other = new List();

  print("Parsing Set");
  print(set);

  // Split the set into lines
  var lines = set.split("\r\n");

  // Test the first line against the header Regex
  var m = reHead.firstMatch(lines[0]);

  // 1. If there are no matches then do something...
  if (m == null) {
    print("Header: no matches");
    return sanitizer.convert(set);
  }

  print("Header: ${m.groupCount} matches");
  for (int i = 0; i < m.groupCount; i++) {
    print("$i: ${m.group(i)}");
  }
  print('\n');

  // 2. Check if this is a Pokemon with a nickname
  if (m.group(2) != null) {
    // lookup the species

    // if it matches, set the species
    // nickname = sanitizer.convert(m.group(1));
    // name = sanitizer.convert(m.group(2));

    // if not, then just set the name
    name = sanitizer.convert(m.group(1)) +
        sanitizer.convert(m.group(2)) +
        sanitizer.convert(m.group(3));
  } else if (m.group(4) != null) {
    // lookup the species

    // if it matches, set the species
    // TD
    name = sanitizer.convert(m.group(4));
  }

  // 3. Check if this is a Pokemon with a specified gender
  if (m.group(6) != null) {
    if (m.group(6) == 'M') {
      gender = 'M';
    } else if (m.group(6) == 'F') {
      gender = 'F';
    }
  }

  // 4. Check if this Pokemon is holding an item
  if (m.group(9) != null) {
    // lockup and set the item
    item = sanitizer.convert(m.group(9));
  }

  // 5. Body Parsing - loop through the other lines
  for (int i = 1; i < lines.length; i++) {
    // 6. Check if the line matches a move
    if (reMove.hasMatch(lines[i])) {
      m = reMove.firstMatch(lines[i]);

      if (m.group(4) != null) {
        // set the hidden power type
      }

      moves.add(sanitizer.convert(m.group(3)));

      // TD - check for slashed in moves

    } else if (reNature.hasMatch(lines[i])) {
      // 7. Check if the line matches a nature
      m = reNature.firstMatch(lines[i]);

      if (m.group(1) != null) {
        nature = m.group(1);
      } else {
        other.add(sanitizer.convert(lines[i]));
      }
    } else {
      // 8. Check if the line matches another attribute
      var attribute = lines[i].split(": ");

      if (attribute.length == 2) {
        if (attribute[0] == "Ability") {
          ability = sanitizer.convert(attribute[1].trim());
        } else if (attribute[0] == "Shiny") {
          shiny = attribute[1].trim() == "Yes" ? true : false;
        } else if (attribute[0] == "Level") {
          level = int.parse(attribute[1]);
        } else if (attribute[0] == "Happiness") {
          happiness = int.parse(attribute[1]);
        } else if (attribute[0] == "IVs") {
        } else if (attribute[0] == "EVs") {
        } else {
          other.add(sanitizer.convert(lines[i]));
        }
      } else {
        // Else it's not a recognized type of line
        other.add(sanitizer.convert(lines[i]));
      }
    }
  }

  return PokemonSet(name: name, item: item, ability: ability, nature: nature);
}

class PokemonSet {
  String name;
  String form;
  String nickname = "";
  String gender = "-";
  String item = "";
  String ability = "";
  bool shiny = false;
  int level = 50;
  int happiness = 255;
  String nature = "Hardy";
  List<String> moves = new List();
  List<String> other = new List();

  PokemonSet({this.name, this.item, this.ability, this.nature});

  @override
  String toString() {
    return "$name @ $item ($nature, $ability)";
  }
}
