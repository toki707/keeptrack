import 'package:flutter/material.dart';

class FlagAvatar extends StatelessWidget {
  const FlagAvatar(this.location, {super.key, this.radius});

  final String? location;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage("https://flagcdn.com/w160/$location.png"),
    );
  }
}
