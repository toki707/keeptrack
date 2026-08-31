import 'package:keeptrack/src/features/voiture/domain/specs.dart';

class Voiture {
  final String id;
  final String name;
  final String? brand;
  final String? description;
  final List<String>? tags;
  final String? classCar;
  final Specs? specs;

  Voiture({
    required this.id,
    required this.name,
    this.brand,
    this.description,
    this.tags,
    this.classCar,
    this.specs,
  });
}
