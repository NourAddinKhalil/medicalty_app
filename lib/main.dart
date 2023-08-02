import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:medicalty/bindings/main_binding.dart';
import 'package:medicalty/constants/themes/dark_theme.dart';
import 'package:medicalty/constants/themes/light_theme.dart';
import 'package:medicalty/controllers/screen_controllers/theme_controller.dart';
import 'package:medicalty/routes/app_router.dart';
import 'package:medicalty/utiles/custom_loading.dart';
import 'constants/app/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return const App();
      },
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      // autoRemove: false,
      builder: (theme) {
        return GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const CustomLoading(
            noBackColor: false,
          ),
          child: GetMaterialApp(
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            title: 'Medicalty',
            getPages: AppRouter.routes,
            debugShowCheckedModeBanner: false,
            themeMode: theme.themeMode,
            theme: LightTheme.lightTheme,
            darkTheme: DarkTheme.darkTheme,
            initialBinding: MainBinding(),
            initialRoute: AppRouter.initialRoute,
          ),
        );
      },
    );
  }
}
