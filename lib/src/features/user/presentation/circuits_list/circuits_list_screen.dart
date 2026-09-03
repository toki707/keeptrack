import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CircuitsListScreen extends StatelessWidget {
  const CircuitsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(height: 10),
            Image.asset("assets/images/KeepTrack_logo.png", width: 200),
            SizedBox(
              width: 148,
              child: Divider(color: Colors.white, thickness: 2),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => context.go('/'),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    color: const Color.fromARGB(255, 131, 131, 131),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/list'),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    color: const Color.fromARGB(255, 131, 131, 131),
                    child: Text(
                      "Circuits",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    color: const Color.fromARGB(255, 131, 131, 131),
                    child: Text(
                      "profil",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
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
