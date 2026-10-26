import 'package:keeptrack/src/features/user/domain/performance.dart';

import 'objectif.dart';

class User {
  final String id;
  final String name;
  final List<Performance> performances;
  final List<Objectif> objectifs;

  User({
    required this.id,
    required this.name,
    required this.performances,
    this.objectifs = const [],
  });

  User copyWith({
    String? id,
    String? name,
    List<Performance>? performances,
    List<Objectif>? objectifs,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      performances: performances ?? this.performances,
      objectifs: objectifs ?? this.objectifs,
    );
  }
}
