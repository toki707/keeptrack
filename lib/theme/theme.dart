import 'package:flutter/material.dart';

class AppColors {
  // Couleurs principales
  static const Color primaryColor = Color.fromARGB(255, 139, 9, 0);
  static const Color primaryAccent = Color.fromARGB(212, 255, 1, 1);
  static const Color backgroundColor = Color.fromARGB(255, 38, 0, 0);
  static const Color scaffoldColor = Color.fromARGB(255, 39, 39, 39);

  // Fond aura
  static const Color auraRed = Color.fromARGB(99, 255, 1, 1);
  static const Color auraBlack = Colors.black;
  static const Color auraDarkRed = Color.fromARGB(54, 204, 0, 0);

  // Textes
  static const Color textColor = Colors.white;
  static const Color textLight = Color.fromARGB(188, 255, 255, 255);
  static const Color textLabel = Color.fromARGB(164, 255, 255, 255);
  static const Color textMuted = Color.fromARGB(150, 255, 255, 255);
  static const Color textBestLap = Color.fromARGB(255, 174, 0, 255);

  // Cartes et boîtes
  static const Color cardColor = Color.fromARGB(148, 19, 19, 19);
  static const Color cardBorder = Color.fromARGB(91, 62, 62, 62);
  static const Color resultCardColor = Color.fromARGB(78, 13, 13, 13);
  static const Color resultCardBorder = Color.fromARGB(82, 247, 247, 247);
  static const Color resultInnerColor = Color.fromARGB(40, 193, 193, 192);
  static const Color cardNameBackground = Color.fromARGB(175, 0, 0, 0);
  static const Color trackCardColor = Color.fromARGB(255, 128, 0, 0);
  static const Color trackCardBorder = Color.fromARGB(218, 48, 48, 48);
  static const Color trackGradientMiddle = Color.fromARGB(83, 63, 2, 2);
  static const Color trackGradientEnd = Color.fromARGB(218, 40, 0, 0);

  // Séparateurs
  static const Color dividerColor = Colors.white;
  static const Color dividerGrey = Color.fromARGB(112, 114, 114, 114);
  static const Color infoLineColor = Color.fromARGB(98, 255, 255, 255);

  // Barre d'onglets
  static const Color tabBarColor = Color.fromARGB(180, 22, 22, 22);
  static const Color tabBarBorder = Color.fromARGB(64, 182, 182, 182);

  // Recherche
  static const Color searchBackground = Color.fromARGB(117, 0, 0, 0);
  static const Color searchHint = Color.fromARGB(109, 223, 176, 176);
  static const Color searchBorder = Color.fromARGB(155, 90, 89, 89);

  // Détail d'un circuit
  static const Color headerShadow = Color.fromARGB(190, 0, 0, 0);
  static const Color addIconButton = Color.fromARGB(157, 241, 1, 1);

  // Bottom sheet "Ajouter un temps"
  static const Color bottomSheetColor = Color.fromARGB(236, 15, 0, 0);
  static const Color dropdownMenuColor = Colors.black;
  static const Color addButtonBorder = Color.fromARGB(133, 0, 0, 0);
  static const Color addButtonStart = Color.fromARGB(157, 70, 0, 0);
  static const Color addButtonEnd = Color.fromARGB(133, 53, 0, 0);
  static const Color inputHint = Colors.white38;
  static const Color inputLabel = Colors.white70;

  // Objectif
  static const Color objectifLabel = Color.fromARGB(255, 201, 184, 184);
  static const Color objectifCardColor = Color.fromARGB(9, 255, 255, 255);
  static const Color objectifCardBorder = Color.fromARGB(31, 255, 255, 255);
  static const Color progressBackground = Color.fromARGB(26, 255, 255, 255);

  // graphique
  static const Color lapFaster = Color.fromARGB(105, 17, 255, 0);
  static const Color lapSlower = Color.fromARGB(115, 255, 1, 1);
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.dark,
  ),

  fontFamily: "Michroma",

  scaffoldBackgroundColor: AppColors.scaffoldColor,
);
