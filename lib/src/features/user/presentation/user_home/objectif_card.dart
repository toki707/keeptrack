import 'package:flutter/material.dart';
import 'package:keeptrack/src/common_widget/styled_card.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/user/domain/objectif.dart';
import 'package:keeptrack/src/features/user/domain/performance.dart';
import 'package:keeptrack/src/features/user/domain/voiture_performance.dart';
import 'package:keeptrack/theme/theme.dart';

class ObjectifCard extends StatelessWidget {
  const ObjectifCard(this.objectif, this.performances, {super.key});

  final Objectif objectif;
  final List<Performance> performances;

  VoiturePerformance? _trouverVoiturePerformance() {
    final performancesCircuit = performances.where(
      (performance) => performance.circuit.id == objectif.circuit.id,
    );
    if (performancesCircuit.isEmpty) {
      return null;
    }

    final voitures = performancesCircuit.first.voitures.where(
      (voiturePerformance) =>
          voiturePerformance.voiture.id == objectif.voiture.id,
    );
    if (voitures.isEmpty) {
      return null;
    }

    return voitures.first;
  }

  @override
  Widget build(BuildContext context) {
    final voiturePerformance = _trouverVoiturePerformance();

    if (voiturePerformance == null) {
      return StyledCard(
        padding: EdgeInsets.all(Sizes.p16),
        color: AppColors.objectifCardColor,
        borderColor: AppColors.objectifCardBorder,
        child: StyledText(
          "Aucun temps enregistré a ${objectif.circuit.name}",
          fontSize: Sizes.p12,
          color: AppColors.textMuted,
        ),
      );
    }

    final meilleurTemps = voiturePerformance.meilleurTemps;
    final ecartMs =
        voiturePerformance.tempsEnMs(meilleurTemps) -
        voiturePerformance.tempsEnMs(objectif.tempsCible);
    final progression = voiturePerformance.progressionObjectif(
      objectif,
      meilleurTemps,
    );
    final objectifAtteint = ecartMs <= 0;

    return StyledCard(
      padding: EdgeInsets.all(Sizes.p16),
      color: AppColors.cardColor,
      borderColor: AppColors.cardBorder,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Icon(
                Icons.timer_outlined,
                color: AppColors.primaryAccent,
                size: Sizes.p20,
              ),
              gapW12,
              StyledText(
                "Chrono a atteindre",
                fontSize: Sizes.p12,
                color: AppColors.objectifLabel,
              ),
            ],
          ),
          gapH12,
          StyledText(
            "Passer sous ${objectif.tempsCible} a ${objectif.circuit.name}",
            maxLines: 2,
          ),
          gapH12,

          Container(
            height: Sizes.p12,
            decoration: BoxDecoration(
              color: AppColors.progressBackground,
              borderRadius: BorderRadius.circular(Sizes.p8),
            ),
            alignment: .centerLeft,
            child: FractionallySizedBox(
              widthFactor: progression,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.p8),
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.primaryAccent],
                  ),
                ),
              ),
            ),
          ),
          gapH12,

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: StyledText(
                  "Record $meilleurTemps",
                  fontSize: Sizes.p12,
                  color: AppColors.textMuted,
                  maxLines: 1,
                ),
              ),
              StyledText(
                objectifAtteint
                    ? "Objectif atteint !"
                    : "encore ${(ecartMs / 1000).toStringAsFixed(3)} s",
                fontSize: Sizes.p12,
                color: AppColors.primaryAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
