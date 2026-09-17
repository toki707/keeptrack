import 'package:keeptrack/src/features/user/domain/performance.dart';

class User {
  final String id;
  final String name;
  final List<Performance> performances;

  User({required this.id, required this.name, required this.performances});

  User copyWith({String? id, String? name, List<Performance>? performances}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      performances: performances ?? this.performances,
    );
  }
}
