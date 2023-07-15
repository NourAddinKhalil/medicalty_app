import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:medicalty/bindings/main_binding.dart';
import 'package:medicalty/constants/themes/dark_theme.dart';
import 'package:medicalty/constants/themes/light_theme.dart';
import 'package:medicalty/controllers/screen_controllers/theme_controller.dart';
import 'package:medicalty/utiles/custom_loading.dart';

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
            // getPages: const [], //AppRouter.routes,
            debugShowCheckedModeBanner: false,
            themeMode: theme.themeMode,
            theme: LightTheme.lightTheme,
            darkTheme: DarkTheme.darkTheme,
            initialBinding: MainBinding(),
            home: const MyHomePage(title: 'home page'),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
