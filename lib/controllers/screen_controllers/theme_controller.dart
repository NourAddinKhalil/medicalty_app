import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'package:medicalty/controllers/master_controller.dart';
import 'package:medicalty/services/app_settings.dart';

class ThemeController extends MasterController {
  ThemeMode _themeMode = ThemeMode.system;
  final themeModes = {
    0: ThemeMode.system,
    1: ThemeMode.light,
    2: ThemeMode.dark,
  };

  ThemeController() {
    final mode = AppSettings.getSettingValue(AppSettings.themeKey, 1);
    _themeMode = themeModes[mode]!;
    Get.changeThemeMode(_themeMode);
  }

  ThemeMode get themeMode {
    return _themeMode;
  }

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      final brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return _themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(int mode) {
    final theme = themeModes[mode]!;
    if (theme != _themeMode) {
      _themeMode = theme;
      Get.changeThemeMode(_themeMode);
      update();
    }
  }
}
