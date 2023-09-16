import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    dialogBackgroundColor: Colors.white,
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.all(0),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.grey,
    ),
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
      shape: BeveledRectangleBorder(),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    useMaterial3: true,
  );
}
