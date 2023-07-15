import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static const themeKey = 'dark-mode-key';
  static const enteredTheDataKey = 'entered-the-data-key';
  static const remindMeKey = 'remind-me-key';
  static const remindTimesKey = 'remind-times-key';
  static const isDisabledKey = 'is-disabled-key';
  static const isDataSaverOnKey = 'is-data-saver-on-key';
  static SharedPreferences? settings;

  static Future<void> initializeSettings() async {
    settings = await SharedPreferences
        .getInstance(); //init(cacheProvider: SharePreferenceCache());
  }

  static T getSettingValue<T>(String key, T initVal) {
    dynamic val;
    if (initVal is bool) {
      val = settings?.getBool(key) ?? initVal;
    } else if (initVal is double) {
      val = settings?.getDouble(key) ?? initVal;
    } else if (initVal is String) {
      val = settings?.getString(key) ?? initVal;
    } else if (initVal is int) {
      val = settings?.getInt(key) ?? initVal;
    } else if (initVal is List<String>) {
      val = settings?.getStringList(key) ?? initVal;
    } else if (initVal is Set<String>) {
      val = settings?.getKeys() ?? initVal;
    }
    // final val = Settings.getValue<T>(key, defaultValue: initVal) ?? initVal;

    return val;
  }

  static void setSettingValue<T>(String key, T value) async {
    if (value is bool) {
      settings?.setBool(key, value);
    } else if (value is double) {
      settings?.setDouble(key, value);
    } else if (value is String) {
      settings?.setString(key, value);
    } else if (value is int) {
      settings?.setInt(key, value);
    } else if (value is List<String>) {
      settings?.setStringList(key, value);
    }
  }
}
