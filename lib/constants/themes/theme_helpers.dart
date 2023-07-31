import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/fonts.gen.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeHelpers {
  // static TextTheme? textThemes;
  static const dARKTHEMETEXTCOLOR = Colors.white;
  // static const _lIGHTTHEMETEXTCOLOR = Colors.black;
  static const primaryColor = ColorsConstant.primaryColor; //Colors.amber;
  static const primaryColorLighter = Color(0xFF707A89); //Colors.amber;
  // static const _deepColor = Color(0xFF011C26); //Colors.deepOrange;

  static SystemUiOverlayStyle systemUiOverlayStyle(
      Color statusBarColor, bool isDark) {
    // var dividerColor = Colors.white;
    var brightness = Brightness.light;
    var brightnessIOS = Brightness.dark;

    if (!isDark) {
      // dividerColor = Colors.black;
      brightness = Brightness.dark;
      brightnessIOS = Brightness.light;
    }
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarBrightness: brightnessIOS, // For iOS (dark icons)
      statusBarIconBrightness: brightness, // For Android (dark icons)
      systemNavigationBarColor: statusBarColor,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: brightness,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
    );
  }

  static DialogTheme dialogTheme(Color color) {
    return DialogTheme(
      surfaceTintColor: color,
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
    );
  }

  static DividerThemeData dividerThemeData(Color color) {
    return DividerThemeData(
      color: color,
      thickness: 0.2,
    );
  }

  static TextStyle titleTextStyle(Color textColor) {
    return TextStyle(
      fontSize: 18.sp,
      color: textColor,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.switzerComplete,
    );
  }

  static BottomNavigationBarThemeData bottomNavigationBarThemeData({
    required Color backColor,
    IconThemeData? selectIcon,
    IconThemeData? unselectIcon,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: backColor,
      selectedIconTheme: selectIcon,
      unselectedIconTheme: unselectIcon,
    );
  }

  static TextButtonThemeData textButtonThemeData(Color primary) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        textStyle: TextStyle(
          fontSize: 18.sp,
          color: primary,
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24.0),
        // ),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonThemeData(Color primary) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        padding: CustomEdgeInsets.all(15),
        textStyle: TextStyle(
          fontSize: 18.sp,
        ),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonThemeData(Color primary) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.r),
          side: BorderSide(color: primary),
        ),
        padding: CustomEdgeInsets.all(15),
        side: BorderSide(color: primary),
        textStyle: TextStyle(
          fontSize: 18.sp,
        ),
      ),
    );
  }

  static TextSelectionThemeData textSelectionThemeData(
      Color cursor, Color selection) {
    return TextSelectionThemeData(
      cursorColor: cursor,
      selectionColor: selection,
    );
  }

  static ButtonThemeData buttonThemeData(Color color) {
    return ButtonThemeData(buttonColor: color);
  }

  static IconThemeData iconThemeData(
      {Color color = Colors.white, double opacity = 0.8}) {
    return IconThemeData(
      color: color,
      opacity: opacity,
      size: 30.sp,
    );
  }

  static TextStyle textTheme(double fontSize) {
    return TextStyle(
      // color: _dARKTHEMETEXTCOLOR,
      fontSize: fontSize.sp,
      fontFamily: FontFamily.switzerComplete,
      // fontWeight: FontWeight.bold,
    );
  }

  static PageTransitionsTheme pageTransitionsTheme() {
    return const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    );
  }
}
