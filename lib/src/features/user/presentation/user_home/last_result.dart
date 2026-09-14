import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';

class LastResult extends StatelessWidget {
  const LastResult(this.currentUser, {super.key});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: const Color.fromARGB(78, 13, 13, 13),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(82, 247, 247, 247),
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(40, 193, 193, 192),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://flagcdn.com/w160/${currentUser.performances.last.circuit.location}.png",
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser.performances.last.circuit.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          currentUser.performances.last.circuit.country!,
                          style: TextStyle(
                            color: const Color.fromARGB(141, 252, 252, 252),
                            fontFamily: "D3Euronism",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    Expanded(child: SizedBox(width: 0)),
                    Image.asset(
                      currentUser.performances.last.circuit.outline!,
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Voiture",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(98, 255, 255, 255),
                      height: 2,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    currentUser.performances.last.voiture.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 15,
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
                    "Temps",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(98, 255, 255, 255),
                      height: 2,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    currentUser.performances.last.temps.last,
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
    );
  }
}
