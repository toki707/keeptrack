import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const new({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(133, 0, 0, 0)),
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: .topLeft,
            end: .bottomRight,
            colors: [
              const Color.fromARGB(157, 70, 0, 0),
              const Color.fromARGB(133, 53, 0, 0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Ajouter",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "D3Euronism",
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
