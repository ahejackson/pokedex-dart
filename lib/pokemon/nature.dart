enum Nature {
  Hardy,
  Lonely,
  Brave,
  Adamant,
  Naughty,
  Bold,
  Docile,
  Relaxed,
  Impish,
  Lax,
  Timid,
  Hasty,
  Serious,
  Jolly,
  Naive,
  Modest,
  Mild,
  Quiet,
  Bashful,
  Rash,
  Calm,
  Gentle,
  Sassy,
  Careful,
  Quirky,
}

// Convert to string
String toString(Nature nature) {
  return nature.toString().split('.').last;
}

// Convert to enum
Nature toNature(String str) {
  return Nature.values.firstWhere((e) => e.toString() == 'Nature.' + str);
}
