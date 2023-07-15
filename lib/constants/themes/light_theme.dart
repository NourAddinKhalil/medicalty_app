import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/constants/themes/theme_helpers.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    // const Color.fromARGB(
    //     246, 255, 254, 254), //ThemeHelpers.deepColor.withAlpha(50), //ThemeHelpers.deepColor[50],
    splashColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: ThemeHelpers.titleTextStyle(Colors.white),
      elevation: 0,
      toolbarTextStyle: const TextStyle(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: ColorsConstant
          .appbarColor, //ThemeHelpers.deepColor.withAlpha(100), //.shade700,
      iconTheme: ThemeHelpers.iconThemeData(),
      actionsIconTheme: ThemeHelpers.iconThemeData(),
      systemOverlayStyle:
          ThemeHelpers.systemUiOverlayStyle(ColorsConstant.appbarColor, true),
      centerTitle: true,
      scrolledUnderElevation: 0.20,
    ),
    bottomNavigationBarTheme: ThemeHelpers.bottomNavigationBarThemeData(
      backColor: ColorsConstant.green1.withAlpha(100),
      selectIcon: ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColor),
      unselectIcon: ThemeHelpers.iconThemeData(
          color: ThemeHelpers.primaryColor, opacity: 0.5),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsConstant.green1,
      foregroundColor: ThemeHelpers.dARKTHEMETEXTCOLOR,
      elevation: 3.0,
    ),
    // primaryColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: ThemeHelpers.primaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: FontFamily.myraidPro,
    useMaterial3: true,
    iconTheme:
        ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColorLighter),
    // primarySwatch: Colors.amber, //ThemeHelpers.primaryColor, //Colors.amber,
    focusColor: ColorsConstant.green1,
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
      ThemeHelpers.primaryColorLighter,
      ThemeHelpers.primaryColorLighter,
    ),
    // textTheme: TextTheme(
    //   displayLarge: ThemeHelpers.textTheme(56.0),
    //   displayMedium: ThemeHelpers.textTheme(52.0),
    //   displaySmall: ThemeHelpers.textTheme(48.0),
    //   headlineMedium: ThemeHelpers.textTheme(44.0),
    //   headlineSmall: ThemeHelpers.textTheme(40.0),
    //   titleLarge: ThemeHelpers.textTheme(36.0),
    //   titleMedium: ThemeHelpers.textTheme(32.0),
    //   titleSmall: ThemeHelpers.textTheme(28.0),
    //   labelLarge: ThemeHelpers.textTheme(24.0),
    // ),
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
