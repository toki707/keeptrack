import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/constants/test_circuits.dart';
import 'package:keeptrack/src/features/circuits/data/remote/circuit_service.dart';
import 'package:keeptrack/src/features/circuits/presentation/circuit_list/circuit_card.dart';

class CircuitsListScreen extends StatelessWidget {
  const CircuitsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("KeepTrack")),
        backgroundColor: Colors.grey,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final circuitsListValue = ref.watch(circuitsListFutureProvider);
          return circuitsListValue.when(
            data: (circuits) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: testCircuits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final circuit = circuits[index];
                  return CircuitCard(circuit);
                },
              ),
            ),
            error: (error, stackTrace) =>
                Center(child: Center(child: Text(error.toString()))),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
