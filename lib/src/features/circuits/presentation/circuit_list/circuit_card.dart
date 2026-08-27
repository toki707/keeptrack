import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuits/domain/circuit.dart';

class CircuitCard extends StatelessWidget {
  const CircuitCard(this.circuit, {super.key});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: Column(children: [Center(child: Text(circuit.name!))]),
    );
  }
}
