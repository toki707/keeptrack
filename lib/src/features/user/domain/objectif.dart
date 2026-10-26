import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class Objectif {
  Objectif({
    required this.id,
    required this.circuit,
    required this.voiture,
    required this.tempsCible,
    required this.tempsDepart,
  });

  final String id;
  final Circuit circuit;
  final Voiture voiture;
  final String tempsCible;
  final String tempsDepart;
}
