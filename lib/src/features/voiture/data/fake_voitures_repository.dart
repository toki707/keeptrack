import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/constants/test_voitures.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class FakeVoituresRepository {
  final List<Voiture> _voitures = testVoitures;

  List<Voiture> getVoituresList() {
    return _voitures;
  }
}

final fakeVoituresRepositoryProvider = Provider<FakeVoituresRepository>((ref) {
  return FakeVoituresRepository();
});
