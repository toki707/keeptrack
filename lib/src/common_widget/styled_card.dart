import 'package:flutter/material.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/theme/theme.dart';

class StyledCard extends StatelessWidget {
  const StyledCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: Sizes.p12,
      horizontal: Sizes.p12,
    ),
    this.color = AppColors.cardColor,
    this.borderColor = AppColors.cardBorder,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Sizes.p12),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: child,
    );
  }
}
