import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class CircuitCaracteristiques extends StatefulWidget {
  const CircuitCaracteristiques(this.circuit, {super.key});

  final Circuit circuit;

  @override
  State<CircuitCaracteristiques> createState() =>
      _CircuitCaracteristiquesState();
}

class _CircuitCaracteristiquesState extends State<CircuitCaracteristiques> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final circuit = widget.circuit;

    return Container(
      padding: .symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(148, 19, 19, 19),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(91, 62, 62, 62),
          width: 2,
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        shape: Border(),
        trailing: SizedBox.shrink(),
        onExpansionChanged: (expanded) =>
            setState(() => _isExpanded = expanded),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Caracteristiques :",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                    fontSize: 19,
                  ),
                ),

                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        subtitle: Divider(
          thickness: 2,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        children: [
          Image.asset(circuit.outline!),

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
    );
  }
}
