import 'package:keeptrack/src/features/user/domain/performance.dart';

import 'objectif.dart';

class User {
  final String? id;
  final String? name;
  final String? banner;
  final String? pfp;
  final List<Performance> performances;
  final List<Objectif> objectifs;

  User({
    required this.id,
    required this.name,
    required this.performances,
    this.banner,
    this.pfp,
    this.objectifs = const [],
  });

  User copyWith({
    String? id,
    String? name,
    String? banner,
    String? pfp,
    List<Performance>? performances,
    List<Objectif>? objectifs,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      pfp: pfp ?? this.pfp,
      performances: performances ?? this.performances,
      objectifs: objectifs ?? this.objectifs,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['_id'];
    if (id != null && id is! String?) {
      throw FormatException(
        "Le Json est invalide : id doit être de type String dans $json",
      );
    }

    final name = json['name'];
    if (name == null || name is! String) {
      throw FormatException(
        "Le Json est invalide : name doit être de type String dans $json",
      );
    }

    final banner = json['banner'];
    if (banner == null || banner is! String) {
      throw FormatException(
        "Le Json est invalide : banner doit être de type String dans $json",
      );
    }

    final pfp = json['pfp'];
    if (pfp == null || pfp is! String) {
      throw FormatException(
        "Le Json est invalide : pfp doit être de type String dans $json",
      );
    }

    final performances = json['performances'];
    if (performances == null || performances is! List) {
      throw FormatException(
        "Le Json est invalide : performances doit être de type List dans $json",
      );
    }

    final objectifs = json['objectifs'] as List?;

    return User(
      id: id as String?,
      name: name as String?,
      banner: banner as String?,
      pfp: pfp as String?,
      performances: performances
          .cast<Map<String, dynamic>>()
          .map((performanceData) => Performance.fromJson(performanceData))
          .toList(),
      objectifs: objectifs != null
          ? objectifs
                .cast<Map<String, dynamic>>()
                .map((objectifData) => Objectif.fromJson(objectifData))
                .toList()
          : <Objectif>[],
    );
  }
}
