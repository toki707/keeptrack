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
        color: const Color.fromARGB(91, 62, 62, 62),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(100, 98, 98, 98),
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
                  "Info :",
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

            Row(
              mainAxisAlignment: .spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Info :",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Info :",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
