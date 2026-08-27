import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/circuits/domain/circuit.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class CircuitService {
  static const url = "http://127.0.0.1:3000";

  Future<List<Circuit>> fetchCircuitList() async {
    final circuits = <Circuit>[];
    try {
      final parsedUrl = Uri.parse('$url/api/circuits');
      final response = await http.get(parsedUrl);
      final statusCode = response.statusCode;
      final data = jsonDecode(response.body);
      if (statusCode != 200) {
        final message = "Erreur survenue";
        throw Exception(message);
      }
      data.forEach((v) => {circuits.add(Circuit.fromJson(v))});
      return circuits;
    } catch (e) {
      rethrow;
    }
  }
}

final circuitsRepositoryProvider = Provider<CircuitService>((ref) {
  return CircuitService();
});

final circuitsListFutureProvider = FutureProvider<List<Circuit>>((ref) {
  final circuitRepository = ref.watch(circuitsRepositoryProvider);

  return circuitRepository.fetchCircuitList();
});
