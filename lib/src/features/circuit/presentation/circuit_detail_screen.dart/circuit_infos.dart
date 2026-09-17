import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class CircuitInfos extends StatelessWidget {
  const new({super.key, required this.circuit});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: const Color.fromARGB(99, 19, 19, 19),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(91, 62, 62, 62),
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: .center,
          children: [
            Row(
              children: [
                Text(
                  "Caracteristiques :",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: const Color.fromARGB(112, 114, 114, 114),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(135, 129, 129, 129),
                ),
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(53, 0, 0, 0),
              ),
              child: Image.asset(circuit.outline!),
            ),

            SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: const Color.fromARGB(112, 114, 114, 114),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Date de creation",
                          style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontFamily: "D3Euronism",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "${circuit.yearCreation!}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Nombre de boxes",
                          style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontFamily: "D3Euronism",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "${circuit.pitboxes}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              thickness: 1,
              color: const Color.fromARGB(112, 114, 114, 114),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Longueur",
                          style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontFamily: "D3Euronism",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "${circuit.lengthKm}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Sens",
                          style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontFamily: "D3Euronism",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "${circuit.run}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              thickness: 1,
              color: const Color.fromARGB(112, 114, 114, 114),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Point le plus haut",
                          style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontFamily: "D3Euronism",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "${circuit.highestPoint}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "point le plus bas",
                          style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontFamily: "D3Euronism",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "${circuit.lowestPoint}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 15,
                          ),
                        ),
                      ],
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
