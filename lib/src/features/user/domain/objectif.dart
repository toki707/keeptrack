import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class Objectif {
  Objectif({
    // required this.id,
    required this.circuit,
    required this.voiture,
    required this.tempsCible,
    required this.tempsDepart,
  });

  // final String id;
  final Circuit circuit;
  final Voiture voiture;
  final String tempsCible;
  final String tempsDepart;

  factory Objectif.fromJson(Map<String, dynamic> json) {
    // final id = json['id'];
    // if (id == null || id is! String) {
    //   throw FormatException(
    //     "Le Json est invalide : id doit être de type String dans $json",
    //   );
    // }

    final circuit = json['circuit'];
    if (circuit == null || circuit is! Map<String, dynamic>) {
      throw FormatException(
        "Le Json est invalide : circuit doit être de type Map dans $json",
      );
    }

    final voiture = json['voiture'];
    if (voiture == null || voiture is! Map<String, dynamic>) {
      throw FormatException(
        "Le Json est invalide : voiture doit être de type Map dans $json",
      );
    }

    final tempsCible = json['tempsCible'];
    if (tempsCible == null || tempsCible is! String) {
      throw FormatException(
        "Le Json est invalide : tempsCible doit être de type String dans $json",
      );
    }

    final tempsDepart = json['tempsDepart'];
    if (tempsDepart == null || tempsDepart is! String) {
      throw FormatException(
        "Le Json est invalide : tempsDepart doit être de type String dans $json",
      );
    }

    return Objectif(
      // id: id,
      circuit: Circuit.fromJson(circuit),
      voiture: Voiture.fromJson(voiture),
      tempsCible: tempsCible,
      tempsDepart: tempsDepart,
    );
  }
}
