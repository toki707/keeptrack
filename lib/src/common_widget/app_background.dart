import 'package:flutter/material.dart';
import 'package:keeptrack/src/common_widget/aura_background.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/theme/theme.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: AuraBackground(
        colors: [AppColors.auraRed, AppColors.auraBlack, AppColors.auraDarkRed],
        points: [Alignment.topLeft, Alignment(12, 0), Alignment.bottomCenter],
        radiuses: [Sizes.p500, Sizes.p100, Sizes.p500],
        child: child,
      ),
    );
  }
}
