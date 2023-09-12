import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    dividerColor: Colors.transparent,
    fontFamily: 'Poppins',
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.grey.withOpacity(.05),
      collapsedBackgroundColor: Colors.grey.withOpacity(.05),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    useMaterial3: true,
  );
}
