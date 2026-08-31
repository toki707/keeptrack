import 'package:keeptrack/src/features/user/domain/performance.dart';

class User {
  final String id;
  final String name;
  final List<Performance> performances;

  User({required this.id, required this.name, required this.performances});
}
