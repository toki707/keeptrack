import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class Performance {
  final Circuit circuit;
  final Voiture voiture;
  final List<String> temps;

  Performance copy({
    Circuit? circuit,
    Voiture? voiture,
    List<String>? temps,
  }) {
    return Performance(
      circuit: circuit ?? this.circuit,
      voiture: voiture ?? this.voiture,
      temps: temps ?? this.temps,
    );
  }

  Performance({
    required this.circuit,
    required this.voiture,
    required this.temps,
  });
}
