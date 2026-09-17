import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/user/domain/voiture_performance.dart';

class CarResultCard extends StatelessWidget {
  const CarResultCard(this.voiturePerformance, {super.key});

  final VoiturePerformance voiturePerformance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(148, 19, 19, 19),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(91, 62, 62, 62),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(voiturePerformance.voiture.preview),
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),

            SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  voiturePerformance.voiture.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                    fontSize: 18,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  "${voiturePerformance.temps.length} Tours",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}