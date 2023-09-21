import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(),
    ),
    dialogBackgroundColor: Colors.white,
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
      contentPadding: EdgeInsets.all(0),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.grey,
    ),
    dividerColor: Colors.transparent,
    fontFamily: 'Poppins',
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.grey.withOpacity(.05),
      collapsedBackgroundColor: Colors.grey.withOpacity(.05),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
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
