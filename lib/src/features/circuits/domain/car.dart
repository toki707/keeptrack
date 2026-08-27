class Car {
  Car({this.name, this.time});

  factory Car.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    if (name != null && name is! String?) {
      throw FormatException(
        "Le Json est invalide : name doit être de type String dans $json",
      );
    }

    final time = json['time'] as List<String>?;
    

    return Car(name: name, time: time);
  }

  final String? name;
  final List<String>? time;
}
