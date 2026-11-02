import 'package:flutter/material.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/theme/theme.dart';

class InfoLine extends StatelessWidget {
  const InfoLine({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p8),
      child: Row(
        children: [
          StyledText(label),
          gapW4,
          Expanded(child: Container(color: AppColors.cardBorder, height: 2)),
          gapW4,
          StyledText(
            value,
            color: valueColor != null ? valueColor! : AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
