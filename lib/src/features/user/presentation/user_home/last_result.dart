import 'package:flutter/material.dart';
import 'package:keeptrack/src/common_widget/flag_avatar.dart';
import 'package:keeptrack/src/common_widget/info_line.dart';
import 'package:keeptrack/src/common_widget/section_title.dart';
import 'package:keeptrack/src/common_widget/styled_card.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
import 'package:keeptrack/theme/theme.dart';

class LastResult extends StatelessWidget {
  const LastResult(this.currentUser, {super.key});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final lastPerformance = currentUser.performances.last;
    final lastVoiturePerformance = lastPerformance.voitures.last;

    return StyledCard(
      padding: EdgeInsets.symmetric(vertical: Sizes.p16, horizontal: Sizes.p12),
      color: AppColors.cardColor,
      borderColor: AppColors.cardBorder,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("Dernier Resultat :"),
          gapH12,
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBorder,
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p8),
              child: Row(
                children: [
                  FlagAvatar(lastPerformance.circuit.location),
                  gapW12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        lastPerformance.circuit.name,
                        fontSize: Sizes.p20,
                      ),
                      StyledText(
                        lastPerformance.circuit.country!,
                        fontSize: Sizes.p12,
                        color: AppColors.textMuted,
                      ),
                    ],
                  ),

                  Expanded(child: SizedBox(width: 0)),
                  Image.asset(
                    lastPerformance.circuit.outline!,
                    width: Sizes.p148,
                  ),
                ],
              ),
            ),
          ),

          gapH24,
          InfoLine(
            label: "Voiture",
            value: lastVoiturePerformance.voiture.name,
          ),
          InfoLine(label: "Temps", value: lastVoiturePerformance.temps.last),
        ],
      ),
    );
  }
}
