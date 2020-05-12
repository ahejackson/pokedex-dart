class Item {
  final String id;
  final int number;
  final String name;
  final String description;

  const Item({
    this.id,
    this.number,
    this.name,
    this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to Item");
    }

    return Item(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      description: json['desc'],
    );
  }
}
