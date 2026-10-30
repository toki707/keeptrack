import 'dart:convert';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class CircuitService {
  static const url = 'http://127.0.0.1:3000';
  final circuits = <Circuit>[];

  Future<List<Circuit>> fetchCircuitList() async {
    try {
      final parsedUrl = Uri.parse('$url/circuits');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      if (statusCode != 200) {
        final message = 'Erreur survenue';
        throw Exception(message);
      }
      final data = jsonDecode(response.body) as List;
      circuits.clear();
      for (final v in data) {
        circuits.add(Circuit.fromJson(v as Map<String, dynamic>));
      }
      return circuits;
    } catch (e) {
      rethrow;
    }
  }

  Circuit fetchCircuitById(String circuitId) {
    return circuits.firstWhere((circuit) => circuit.id == circuitId);
  }
}

final circuitsRepositoryProvider = Provider<CircuitService>((ref) {
  return CircuitService();
});

final circuitsListFutureProvider = FutureProvider<List<Circuit>>((ref) {
  final circuitRepository = ref.watch(circuitsRepositoryProvider);

  return circuitRepository.fetchCircuitList();
});