import 'package:keeptrack/src/features/circuits/domain/car.dart';
import 'package:keeptrack/src/features/circuits/domain/fastest_car.dart';

class Circuit {
  Circuit({
    required this.id,
    this.name,
    this.country,
    this.lengthKm,
    this.fastestCar,
    this.cars,
    this.highestPoint,
    this.lowestPoint,
    this.yearCreation,
  });

  factory Circuit.fromJson(Map<String, dynamic> json) {
    final id = json['_id'];
    if (id != null && id is! String?) {
      throw FormatException(
        "Le Json est invalide : id doit être de type String dans $json",
      );
    }

    final name = json['name'];
    if (name != null && name is! String?) {
      throw FormatException(
        "Le Json est invalide : name doit être de type String dans $json",
      );
    }

    final country = json['country'];
    if (country != null && country is! String?) {
      throw FormatException(
        "Le Json est invalide : country doit être de type String dans $json",
      );
    }

    final lengthKm = json['length_km'];
    if (lengthKm != null && lengthKm is! double?) {
      throw FormatException(
        "Le Json est invalide : lengthKm doit être de type double dans $json",
      );
    }

    final fastestCar = json['fastest_car'] as Map<String, dynamic>?;

    final cars = json['cars'] as List?;

    final highestPoint = json['highest_point'];
    if (highestPoint != null && highestPoint is! String?) {
      throw FormatException(
        "Le Json est invalide : highestPoint doit être de type string dans $json",
      );
    }

    final lowestPoint = json['lowest_point'];
    if (lowestPoint != null && lowestPoint is! String?) {
      throw FormatException(
        "Le Json est invalide : lowestPoint doit être de type string dans $json",
      );
    }

    return Circuit(
      id: id,
      name: name,
      country: country,
      lengthKm: lengthKm,
      fastestCar: FastestCar.fromJson(fastestCar!),
      cars: cars != null
          ? cars
                .cast<Map<String, dynamic>>()
                .map((typesData) => Car.fromJson(typesData))
                .toList()
          : <Car>[],
      highestPoint: highestPoint,
      lowestPoint: lowestPoint,
    );
  }

  final String id;
  final String? name;
  final String? country;
  final double? lengthKm;
  final FastestCar? fastestCar;
  final List<Car>? cars;
  final int? yearCreation;
  final String? highestPoint;
  final String? lowestPoint;
}
