import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const new({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "D3Euronism",
          color: Colors.white,
          fontSize: 21,
        ),
      ),
    );
  }
}
