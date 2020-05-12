class Ability {
  final String id;
  final int number;
  final String name;
  final String description;

  const Ability({
    this.id,
    this.number,
    this.name,
    this.description,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to Ability");
    }

    return Ability(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      description: json['desc'],
    );
  }
}
