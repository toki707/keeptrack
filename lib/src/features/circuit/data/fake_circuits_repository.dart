import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/constants/test_circuits.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class FakeCircuitsRepository {
  final List<Circuit> _circuits = testCircuits;
  List<Circuit> getCircuitsList() {
    return _circuits;
  }
}

final fakeCircuitsRepositoryProvider = Provider<FakeCircuitsRepository>((ref) {
  return FakeCircuitsRepository();
});


