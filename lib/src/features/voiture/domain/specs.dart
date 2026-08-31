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
}
