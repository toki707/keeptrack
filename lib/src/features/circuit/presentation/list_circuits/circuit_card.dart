import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class CircuitCard extends StatelessWidget {
  const CircuitCard(this.circuit, {super.key});

  final Circuit circuit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () =>
          context.goNamed("circuitDetail", pathParameters: {'id': circuit.id}),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(circuit.preview!),
            fit: BoxFit.fitHeight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Image.asset(circuit.outline!, width: size.width * 0.35),
            Expanded(child: SizedBox(height: 0)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(175, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisSize: .max,
                mainAxisAlignment: .start,
                children: [
                  Text(
                    circuit.name,
                    style: TextStyle(
                      fontFamily: "D3Euronism",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(child: SizedBox(width: 0)),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://flagcdn.com/w160/${circuit.location}.png",
                    ),
                    radius: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
