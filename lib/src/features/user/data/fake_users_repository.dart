import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/constants/test_users.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/user/domain/performance.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
import 'package:keeptrack/src/features/user/domain/voiture_performance.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class FakeUsersRepository {
  final List<User> _users = testUsers;

  List<User> getUsersList() {
    return _users;
  }

  User getUserById(String userId) {
    final user = _users.firstWhere((user) => user.id == userId);

    return user;
  }

  void addUserPerformance({
    required String userId,
    required Circuit circuit,
    required Voiture voiture,
    required List<String> temps,
  }) {
    final index = _users.indexWhere((user) => user.id == userId);
    if (index == -1) return;

    final user = _users[index];

    final performanceIndex = user.performances.indexWhere(
      (performance) => performance.circuit.id == circuit.id,
    );

    final nouvelleVoiturePerformance = VoiturePerformance(
      voiture: voiture,
      temps: temps,
    );

    final List<Performance> nouvellesPerformances;

    if (performanceIndex == -1) {
      nouvellesPerformances = [
        ...user.performances,
        Performance(circuit: circuit, voitures: [nouvelleVoiturePerformance]),
      ];
    } else {
      final performanceExistante = user.performances[performanceIndex];
      nouvellesPerformances = [
        for (final performance in user.performances)
          if (performance == performanceExistante)
            performance.copyWith(
              voitures: [...performance.voitures, nouvelleVoiturePerformance],
            )
          else
            performance,
      ];
    }

    _users[index] = user.copyWith(performances: nouvellesPerformances);
  }
}

final fakeUsersRepositoryProvider = Provider<FakeUsersRepository>((ref) {
  return FakeUsersRepository();
});
