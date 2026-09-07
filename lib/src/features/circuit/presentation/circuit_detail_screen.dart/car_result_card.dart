import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/user/domain/performance.dart';

class CarResultCard extends StatelessWidget {
  const new(this.performance, {super.key});

  final Performance performance;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 24, 24, 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(performance.voiture.preview),
                ),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),

            SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  performance.voiture.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                    fontSize: 10,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  "${performance.temps.length} Tours",
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
