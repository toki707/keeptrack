import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/user/domain/voiture_performance.dart';

class Performance {
  final Circuit circuit;
  final List<VoiturePerformance> voitures;

  Performance({required this.circuit, required this.voitures});

  Performance copyWith({Circuit? circuit, List<VoiturePerformance>? voitures}) {
    return Performance(
      circuit: circuit ?? this.circuit,
      voitures: voitures ?? this.voitures,
    );
  }

  factory Performance.fromJson(Map<String, dynamic> json) {
    final circuit = json['circuit'];
    if (circuit == null || circuit is! Map<String, dynamic>) {
      throw FormatException(
        "Le Json est invalide : circuit doit être de type Map dans $json",
      );
    }

    final voitures = json['voitures'];
    if (voitures == null || voitures is! List) {
      throw FormatException(
        "Le Json est invalide : voitures doit être de type List dans $json",
      );
    }

    return Performance(
      circuit: Circuit.fromJson(circuit),
      voitures: voitures
          .cast<Map<String, dynamic>>()
          .map((voitureData) => VoiturePerformance.fromJson(voitureData))
          .toList(),
    );
  }
}
