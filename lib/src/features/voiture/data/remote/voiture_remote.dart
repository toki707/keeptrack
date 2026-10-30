import 'dart:convert';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class VoitureService {
  static const url = 'http://127.0.0.1:3000';
  final voitures = <Voiture>[];

  Future<List<Voiture>> fetchVoitureList() async {
    try {
      final parsedUrl = Uri.parse('$url/api/voitures');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        final message = 'Erreur survenue';
        throw Exception(message);
      }
      final data = jsonDecode(response.body) as List;
      voitures.clear();
      for (final v in data) {
        voitures.add(Voiture.fromJson(v as Map<String, dynamic>));
      }
      return voitures;
    } catch (e) {
      rethrow;
    }
  }

  Voiture fetchVoitureById(String voitureId) {
    return voitures.firstWhere((voiture) => voiture.id == voitureId);
  }
}

final voituresRepositoryProvider = Provider<VoitureService>((ref) {
  return VoitureService();
});

final voituresListFutureProvider = FutureProvider<List<Voiture>>((ref) {
  final voitureRepository = ref.watch(voituresRepositoryProvider);

  return voitureRepository.fetchVoitureList();
});
