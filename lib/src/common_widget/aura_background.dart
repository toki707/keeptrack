import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';

class AuraBackground extends StatelessWidget {
  final List<Color> colors;
  final List<Alignment> points;
  final List<double> radiuses;
  final Widget child;

  const AuraBackground({
    super.key,
    required this.colors,
    required this.points,
    required this.radiuses,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AuraBox(spots: _makeSpots(), child: child);
  }

  List<AuraSpot> _makeSpots() {
    assert(colors.length == points.length && colors.length == radiuses.length);
    List<AuraSpot> spots = [];
    for (int numeroSpot = 0; numeroSpot < colors.length; numeroSpot++) {
      spots.add(
        AuraSpot(
          color: colors[numeroSpot],
          radius: radiuses[numeroSpot],
          alignment: points[numeroSpot],
          blurRadius: radiuses[numeroSpot] / 8,
        ),
      );
    }
    return spots;
  }
}


