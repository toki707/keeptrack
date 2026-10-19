import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class TrackPres extends StatelessWidget {
  const new(this.circuit, {super.key});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: .start,

        children: [
          Row(
            crossAxisAlignment: .center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://flagcdn.com/w160/${circuit.location}.png",
                ),
              ),
              SizedBox(width: 8),

              Text(
                circuit.name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "D3Euronism",
                  fontSize: 50,
                ),
              ),
            ],
          ),

          SizedBox(height: 4),

          Text(
            circuit.description!,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontFamily: "D3Euronism",
              fontSize: 30,
            ),
          ),

          SizedBox(height: 40),

          Text(
            "${circuit.country}, ${circuit.city}",
            style: TextStyle(
              color: const Color.fromARGB(188, 255, 255, 255),
              fontFamily: "D3Euronism",
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
