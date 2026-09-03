import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class LastTrackDriven extends StatelessWidget {
  const LastTrackDriven(this.circuit, {super.key});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Image.asset(circuit.preview!, height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 131, 131, 131),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://flagcdn.com/w160/${circuit.location}.png",
                        ),
                      ),
                    ),
                    child: Expanded(child: SizedBox(width: 0)),
                  ),
                  Image.asset(circuit.outline!, height: 90),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    circuit.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),

                  SizedBox(
                    width: 120,
                    child: Text(
                      "${circuit.country}, ${circuit.city}",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
