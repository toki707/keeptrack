import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class CircuitInfos extends StatelessWidget {
  const new({
    super.key,
    required this.circuit,
  });

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 131, 131, 131),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Longueur",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(color: Colors.white, height: 2),
                  ),
                  SizedBox(width: 5),
                  Text(
                    circuit.lengthKm!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Annee de creation",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(color: Colors.white, height: 2),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "${circuit.yearCreation!}",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Point culminant",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(color: Colors.white, height: 2),
                  ),
                  SizedBox(width: 5),
                  Text(
                    circuit.highestPoint!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Point le plus bas",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(color: Colors.white, height: 2),
                  ),
                  SizedBox(width: 5),
                  Text(
                    circuit.lowestPoint!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
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
