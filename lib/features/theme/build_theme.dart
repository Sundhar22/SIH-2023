import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.grey.withOpacity(.05),
      collapsedBackgroundColor: Colors.grey.withOpacity(.05),
    ),
    chipTheme: const ChipThemeData(
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      showCheckmark: false,
      shape: StadiumBorder(),
      selectedColor: Colors.black,
      disabledColor: Colors.white,
      secondaryLabelStyle: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      elevation: 3,
      labelStyle: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
    ),
    useMaterial3: true,
  );
}
