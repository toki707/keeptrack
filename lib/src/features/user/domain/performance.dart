import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class Performance {
  final Circuit circuit;
  final Voiture voiture;
  final List<String> temps;

  Performance({
    required this.circuit,
    required this.voiture,
    required this.temps,
  });
}
