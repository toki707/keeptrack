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
        color: const Color.fromARGB(255, 131, 131, 131),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 85, 85, 85),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://flagcdn.com/w160/${currentUser.performances.last.circuit.location}.png",
                          ),
                        ),
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
                          ),
                        ),
                        Text(
                          currentUser.performances.last.circuit.country!,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "D3Euronism",
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),

                    Expanded(child: SizedBox(width: 0)),
                    Image.asset(
                      currentUser.performances.last.circuit.outline!,
                      width: 120,
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
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(child: Container(color: Colors.white, height: 2)),
                  SizedBox(width: 5),
                  Text(
                    currentUser.performances.last.voiture.name,
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
                    "Temps",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(child: Container(color: Colors.white, height: 2)),
                  SizedBox(width: 5),
                  Text(
                    currentUser.performances.last.temps.last,
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
