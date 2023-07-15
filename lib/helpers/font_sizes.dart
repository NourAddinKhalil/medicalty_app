import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FontSizes {
  // final late BuildContext _context;
  static BuildContext get getContext {
    return Get.context!;
  }

  /// 36
  static TextStyle? get h1 {
    final context = getContext;
    return Theme.of(context).textTheme.displayLarge;
  }

  /// 32
  static TextStyle? get h2 {
    final context = getContext;
    return Theme.of(context).textTheme.displayMedium;
  }

  /// 28
  static TextStyle? get h3 {
    final context = getContext;
    return Theme.of(context).textTheme.displaySmall;
  }

  /// 24
  static TextStyle? get h4 {
    final context = getContext;
    return Theme.of(context).textTheme.headlineLarge;
  }

  /// 20
  static TextStyle? get h5 {
    final context = getContext;
    return Theme.of(context).textTheme.headlineMedium;
  }

  /// 18
  static TextStyle? get h6 {
    final context = getContext;
    return Theme.of(context).textTheme.headlineSmall;
  }

  /// 16
  static TextStyle? get h7 {
    final context = getContext;
    return Theme.of(context).textTheme.titleLarge;
  }

  /// 14
  static TextStyle? get h8 {
    final context = getContext;
    return Theme.of(context).textTheme.titleMedium;
  }

  /// 12
  static TextStyle? get h9 {
    final context = getContext;
    return Theme.of(context).textTheme.titleSmall;
  }
}
