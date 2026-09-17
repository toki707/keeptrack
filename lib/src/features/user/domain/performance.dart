import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/user/domain/voiture_performance.dart';

class Performance {
  final Circuit circuit;
  final List<VoiturePerformance> voitures;

  Performance({
    required this.circuit,
    required this.voitures,
  });

  Performance copyWith({
    Circuit? circuit,
    List<VoiturePerformance>? voitures,
  }) {
    return Performance(
      circuit: circuit ?? this.circuit,
      voitures: voitures ?? this.voitures,
    );
  }
}