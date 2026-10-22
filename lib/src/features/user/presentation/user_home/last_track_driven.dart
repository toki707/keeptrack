import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/common_widget/flag_avatar.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/theme/theme.dart';

class LastTrackDriven extends StatelessWidget {
  const LastTrackDriven(this.circuit, {super.key});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.goNamed("circuitDetail", pathParameters: {'id': circuit.id}),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.p16),
          child: Container(
            height: Sizes.p148,
            width: Sizes.p500,
            decoration: BoxDecoration(
              color: AppColors.trackCardColor,
              border: Border.all(color: AppColors.trackCardBorder, width: 2),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  circuit.preview!,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.4, 0.8],
                      colors: [
                        Colors.transparent,
                        AppColors.trackGradientMiddle,
                        AppColors.trackGradientEnd,
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    gapW12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Sizes.p32,
                          child: FlagAvatar(circuit.location),
                        ),
                        Image.asset(circuit.outline!, height: Sizes.p96),
                      ],
                    ),
                    gapW28,
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(circuit.name),
                        SizedBox(
                          width: Sizes.p120,
                          child: StyledText(
                            "${circuit.country}, ${circuit.city}",
                            fontSize: Sizes.p12,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
