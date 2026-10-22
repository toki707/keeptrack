import 'package:flutter/material.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/theme/theme.dart';


class InfoLine extends StatelessWidget {
  const InfoLine({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p8),
      child: Row(
        children: [
          StyledText(label),
          gapW4,
          Expanded(child: Container(color: AppColors.infoLineColor, height: 2)),
          gapW4,
          StyledText(value),
        ],
      ),
    );
  }
}
