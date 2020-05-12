import 'dart:convert' show HtmlEscape;
import 'dart:developer' as developer;

import 'package:pokedex/pokemon/pokemon.dart';
import 'package:pokedex/pokemon/gender.dart';

final RegExp reHead = RegExp(
    r"^(?:(.* \()([A-Z][a-z0-9:']+\.?(?:[- ][A-Za-z][a-z0-9:']*\.?)*)(\))|([A-Z][a-z0-9:']+\.?(?:[- ][A-Za-z][a-z0-9:']*\.?)*))(?:( \()([MF])(\)))?(?:( @ )([A-Z][a-z0-9:']*(?:[- ][A-Z][a-z0-9:']*)*))?( *)$");
final RegExp reMove = RegExp(
    r"^(-)( ([A-Z][a-z\']*(?:[- ][A-Za-z][a-z\']*)*)(?: \[([A-Z][a-z]+)\])?(?: / [A-Z][a-z\']*(?:[- ][A-Za-z][a-z\']*)*)* *)$");
final RegExp reNature = RegExp(r"^([A-Z][a-z]+)?(?: Nature)(?: *)$");
final RegExp reStats = RegExp(
    r"^(\d+ HP)?( / )?(\d+ Atk)?( / )?(\d+ Def)?( / )?(\d+ SpA)?( / )?(\d+ SpD)?( / )?(\d+ Spe)?( *)$");

/// Parse a string into a list of Pokemon sets
List<Pokemon> parsePaste(String paste) {
  // Split the paste into sets (seperated by a double new line")
  var sets = paste.split("\r\n\r\n");

  // Parse all sets and remove any null sets
  return sets.map((set) => parseSet(set)).toList()
    ..removeWhere((set) => set == null);
}

/// Parse a string into a Pokemon set
Pokemon parseSet(String set) {
  if (set.length == 0) return null;

  var sanitizer = const HtmlEscape();
  String name;

  developer.log("Parsing Set:\n$set");

  // Split the set into lines
  var lines = set.split("\r\n");

  // Test the first line against the header Regex
  var m = reHead.firstMatch(lines[0]);

  // 1. If there are no matches then do something...
  if (m == null) {
    developer.log("Header: no matches");
    return Pokemon(notes: lines.map((line) => sanitizer.convert(line)));
  }

  developer.log("Header: ${m.groupCount} matches");
  for (int i = 0; i < m.groupCount; i++) {
    developer.log("$i: ${m.group(i)}");
  }

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

  var pkmn = Pokemon(name: name);

  // 3. Check if this is a Pokemon with a specified gender
  if (m.group(6) != null) {
    if (m.group(6) == 'M') {
      pkmn.gender = Gender.male;
    } else if (m.group(6) == 'F') {
      pkmn.gender = Gender.female;
    }
  }

  // 4. Check if this Pokemon is holding an item
  if (m.group(9) != null) {
    // lockup and set the item
    String item = sanitizer.convert(m.group(9));
    pkmn.item = item;
  }

  // 5. Body Parsing - loop through the other lines
  for (int i = 1; i < lines.length; i++) {
    // 6. Check if the line matches a move
    if (reMove.hasMatch(lines[i])) {
      m = reMove.firstMatch(lines[i]);

      if (m.group(4) != null) {
        // set the hidden power type
      }

      pkmn.moves.add(sanitizer.convert(m.group(3)));

      // TD - check for slashed in moves

    } else if (reNature.hasMatch(lines[i])) {
      // 7. Check if the line matches a nature
      m = reNature.firstMatch(lines[i]);

      if (m.group(1) != null) {
//        pkmn.nature = m.group(1); // TODO
      } else {
        pkmn.notes.add(sanitizer.convert(lines[i]));
      }
    } else {
      // 8. Check if the line matches another attribute
      var attribute = lines[i].split(": ");

      if (attribute.length == 2) {
        if (attribute[0] == "Ability") {
          pkmn.ability = sanitizer.convert(attribute[1].trim());
        } else if (attribute[0] == "Shiny") {
          pkmn.shiny = attribute[1].trim() == "Yes" ? true : false;
        } else if (attribute[0] == "Level") {
          pkmn.level = int.parse(attribute[1]);
        } else if (attribute[0] == "Happiness") {
          pkmn.happiness = int.parse(attribute[1]);
        } else if (attribute[0] == "IVs") {
        } else if (attribute[0] == "EVs") {
        } else {
          pkmn.notes.add(sanitizer.convert(lines[i]));
        }
      } else {
        // Else it's not a recognized type of line
        pkmn.notes.add(sanitizer.convert(lines[i]));
      }
    }
  }

  return pkmn;
}
