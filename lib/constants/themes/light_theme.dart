import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/constants/themes/theme_helpers.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    // const Color.fromARGB(
    //     246, 255, 254, 254), //ThemeHelpers.deepColor.withAlpha(50), //ThemeHelpers.deepColor[50],
    splashColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: ThemeHelpers.titleTextStyle(Colors.black),
      elevation: 0,
      toolbarTextStyle: const TextStyle(color: Colors.black),
      foregroundColor: Colors.black,
      backgroundColor: Colors
          .transparent, //ThemeHelpers.deepColor.withAlpha(100), //.shade700,
      iconTheme: ThemeHelpers.iconThemeData(
        color: ThemeHelpers.primaryColor,
      ),
      actionsIconTheme: ThemeHelpers.iconThemeData(
        color: ThemeHelpers.primaryColor,
      ),
      systemOverlayStyle:
          ThemeHelpers.systemUiOverlayStyle(Colors.transparent, false),
      centerTitle: true,
      scrolledUnderElevation: 0.20,
    ),
    bottomNavigationBarTheme: ThemeHelpers.bottomNavigationBarThemeData(
      backColor: ColorsConstant.primaryColor.withAlpha(100),
      selectIcon: ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColor),
      unselectIcon: ThemeHelpers.iconThemeData(
          color: ThemeHelpers.primaryColor, opacity: 0.5),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsConstant.primaryColor,
      foregroundColor: ThemeHelpers.dARKTHEMETEXTCOLOR,
      elevation: 3.0,
    ),
    // primaryColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: ThemeHelpers.primaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: FontFamily.switzerComplete,
    useMaterial3: true,
    iconTheme: ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColor),
    // primarySwatch: Colors.amber, //ThemeHelpers.primaryColor, //Colors.amber,
    focusColor: ColorsConstant.primaryColor,
    elevatedButtonTheme:
        ThemeHelpers.elevatedButtonThemeData(ThemeHelpers.primaryColor),
    outlinedButtonTheme:
        ThemeHelpers.outlinedButtonThemeData(ThemeHelpers.primaryColor),
    textButtonTheme:
        ThemeHelpers.textButtonThemeData(ThemeHelpers.primaryColor),
    buttonTheme: ThemeHelpers.buttonThemeData(ThemeHelpers.primaryColor),
    primaryIconTheme:
        ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColor),
    textSelectionTheme: ThemeHelpers.textSelectionThemeData(
      ThemeHelpers.primaryColor,
      ThemeHelpers.primaryColorLighter,
    ),
    textTheme: TextTheme(
      displayLarge: ThemeHelpers.textTheme(36.0),
      displayMedium: ThemeHelpers.textTheme(32.0),
      displaySmall: ThemeHelpers.textTheme(28.0),
      headlineLarge: ThemeHelpers.textTheme(24.0),
      headlineMedium: ThemeHelpers.textTheme(20.0),
      headlineSmall: ThemeHelpers.textTheme(18.0),
      titleLarge: ThemeHelpers.textTheme(16.0),
      titleMedium: ThemeHelpers.textTheme(14.0),
      titleSmall: ThemeHelpers.textTheme(12.0),
    ),
    applyElevationOverlayColor: true,
    cardTheme: const CardTheme(
      surfaceTintColor: Color.fromARGB(255, 234, 234, 234),
    ),
    pageTransitionsTheme: ThemeHelpers.pageTransitionsTheme(),
    dividerTheme: ThemeHelpers.dividerThemeData(Colors.grey),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Colors.white,
    ),
    dialogTheme: ThemeHelpers.dialogTheme(Colors.white),
  );
}
