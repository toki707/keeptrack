import 'package:flutter/foundation.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

@immutable
class VoiturePerformance {
  const VoiturePerformance({required this.voiture, required this.temps});

  final Voiture voiture;
  final List<String> temps;

  VoiturePerformance copyWith({Voiture? voiture, List<String>? temps}) {
    return VoiturePerformance(
      voiture: voiture ?? this.voiture,
      temps: temps ?? this.temps,
    );
  }
}
