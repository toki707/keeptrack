import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: () {},
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
    );
  }
}
