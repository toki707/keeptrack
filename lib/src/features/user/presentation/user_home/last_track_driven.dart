import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class LastTrackDriven extends StatelessWidget {
  const LastTrackDriven(this.circuit, {super.key});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.goNamed("circuitDetail", pathParameters: {'id': circuit.id}),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 150,
            width: 500,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 128, 0, 0),
              border: Border.all(
                color: const Color.fromARGB(218, 48, 48, 48),
                width: 2,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  circuit.preview!,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.4, 0.8],
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(83, 63, 2, 2),
                        Color.fromARGB(218, 40, 0, 0),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://flagcdn.com/w160/${circuit.location}.png",
                            ),
                          ),
                        ),
                        Image.asset(circuit.outline!, height: 90),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          circuit.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            "${circuit.country}, ${circuit.city}",
                            style: const TextStyle(
                              color: Color.fromARGB(155, 255, 255, 255),
                              fontFamily: "D3Euronism",
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
