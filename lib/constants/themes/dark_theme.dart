import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/constants/themes/theme_helpers.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    splashColor: Colors.black,
    appBarTheme: AppBarTheme(
      titleTextStyle: ThemeHelpers.titleTextStyle(Colors.white),
      elevation: 0,
      toolbarTextStyle: const TextStyle(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor:
          Colors.black, //ThemeHelpers.deepColor.withAlpha(100), //.shade700,
      iconTheme: ThemeHelpers.iconThemeData(),
      actionsIconTheme: ThemeHelpers.iconThemeData(),
      systemOverlayStyle: ThemeHelpers.systemUiOverlayStyle(Colors.black, true),
      centerTitle: true,
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
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: ThemeHelpers.primaryColorLighter,
      brightness: Brightness.dark,
    ),
    fontFamily: FontFamily.myraidPro,
    useMaterial3: true,
    iconTheme:
        ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColorLighter),
    // primarySwatch: Colors.amber, //ThemeHelpers.primaryColor, //Colors.amber,
    focusColor: ColorsConstant.green1,
    elevatedButtonTheme:
        ThemeHelpers.elevatedButtonThemeData(ThemeHelpers.primaryColor),
    textButtonTheme:
        ThemeHelpers.textButtonThemeData(ThemeHelpers.primaryColor),
    outlinedButtonTheme:
        ThemeHelpers.outlinedButtonThemeData(ThemeHelpers.primaryColor),
    buttonTheme: ThemeHelpers.buttonThemeData(ThemeHelpers.primaryColor),
    primaryIconTheme:
        ThemeHelpers.iconThemeData(color: ThemeHelpers.primaryColorLighter),
    textSelectionTheme: ThemeHelpers.textSelectionThemeData(
      ThemeHelpers.primaryColor,
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
    pageTransitionsTheme: ThemeHelpers.pageTransitionsTheme(),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color.fromARGB(255, 23, 23, 23),
    ),
    dividerTheme: ThemeHelpers.dividerThemeData(Colors.white24),
    // cardTheme: const CardTheme(
    //   color: Colors.black,
    // ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
    ),
    dialogTheme: ThemeHelpers.dialogTheme(Colors.grey.shade900),
  );
}
