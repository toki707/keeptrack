class FastestCar {
  FastestCar({this.name, this.time});

  factory FastestCar.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    if (name != null && name is! String?) {
      throw FormatException(
        "Le Json est invalide : name doit être de type String dans $json",
      );
    }

    final time = json['name'];
    if (time != null && time is! String?) {
      throw FormatException(
        "Le Json est invalide : time doit être de type String dans $json",
      );
    }

    return FastestCar(name: name, time: time);
  }

  final String? name;
  final String? time;
}
