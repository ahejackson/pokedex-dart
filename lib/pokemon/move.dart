class Move {
  final String id;
  final int number;
  final String name;
  final String type;
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
      type: json['type'],
      basePower: json['basePower'],
      description: json['desc'],
    );
  }
}
