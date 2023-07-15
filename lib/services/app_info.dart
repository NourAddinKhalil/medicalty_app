import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';

class AppInfo {
  static late PackageInfo _packageInfo;

  static Future<void> getPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get getAppName {
    return _packageInfo.appName;
  }

  static String get getAppVersion {
    return _packageInfo.version;
  }

  static String get getAppBiuldNumber {
    return _packageInfo.buildNumber;
  }

  static String get getAppPackageName {
    return _packageInfo.packageName;
  }

  static String get getTeamInfo {
    return 'MasterzTeam ${DateTime.now().year}\u00a9';
  }

  static String get getDevloperTeamName {
    return 'Powered By MasterzTeam';
  }

  static Widget get getDevloperTeamNameWidget {
    return Text(
      getDevloperTeamName,
      style: TextStyle(
        fontSize: 36.sp,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  static Widget get getAppInfo {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppInfo.getAppName,
          style: TextStyle(
            fontSize: 32.sp,
          ),
        ),
        const VerticalSizedBox(12),
        Text(
          AppInfo.getAppVersion,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey,
          ),
        ),
        const VerticalSizedBox(12),
        Text(
          AppInfo.getTeamInfo,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  static Widget appIcon({
    double circle = 150.0,
    double radius = 75.0,
  }) {
    return CircleAvatar(
      radius: radius.r,
      backgroundColor: const Color(0xFF0070A4),
      child: ClipOval(
        child: ImageHelpers.getAssetImage(
          circle,
          circle,
          pic: 'logo',
        ),
      ),
    );
  }
}
