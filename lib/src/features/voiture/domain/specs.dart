class Specs {
  final String bhp;
  final String torque;
  final String weight;
  final String topSpeed;
  final String acceleration;
  final String pwratio;
  final int? range;

  Specs({
    required this.bhp,
    required this.torque,
    required this.weight,
    required this.topSpeed,
    required this.acceleration,
    required this.pwratio,

    this.range,
  });

  factory Specs.fromJson(Map<String, dynamic> json) {
    final bhp = json['bhp'];
    if (bhp == null || bhp is! String) {
      throw FormatException(
        "Le Json est invalide : bhp doit être de type String dans $json",
      );
    }

    final torque = json['torque'];
    if (torque == null || torque is! String) {
      throw FormatException(
        "Le Json est invalide : torque doit être de type String dans $json",
      );
    }

    final weight = json['weight'];
    if (weight == null || weight is! String) {
      throw FormatException(
        "Le Json est invalide : weight doit être de type String dans $json",
      );
    }

    final topSpeed = json['topSpeed'];
    if (topSpeed == null || topSpeed is! String) {
      throw FormatException(
        "Le Json est invalide : topSpeed doit être de type String dans $json",
      );
    }

    final acceleration = json['acceleration'];
    if (acceleration == null || acceleration is! String) {
      throw FormatException(
        "Le Json est invalide : acceleration doit être de type String dans $json",
      );
    }

    final pwratio = json['pwratio'];
    if (pwratio == null || pwratio is! String) {
      throw FormatException(
        "Le Json est invalide : pwratio doit être de type String dans $json",
      );
    }

    final range = json['range'];
    if (range != null && range is! int?) {
      throw FormatException(
        "Le Json est invalide : range doit être de type int dans $json",
      );
    }

    return Specs(
      bhp: bhp,
      torque: torque,
      weight: weight,
      topSpeed: topSpeed,
      acceleration: acceleration,
      pwratio: pwratio,
      range: range as int?,
    );
  }
}
