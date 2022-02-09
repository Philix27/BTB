import 'package:btb/controller/all_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:btb/core/auth_switch.dart';
import 'package:btb/core/theme/theme_dark.dart';
import 'package:btb/core/theme/theme_light.dart';
// import 'package:btb/core/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // final AppRouter _appRouter = AppRouter();

    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   title: 'BTB',
    //   routeInformationParser: _appRouter.defaultRouteParser(),
    //   routerDelegate: _appRouter.delegate(),
    //   theme: LIGHT_THEME,
    //   darkTheme: DARK_THEME,
    // );

    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Pharmzy',
      initialRoute: "/",
      home: const AuthSwitch(),
      theme: LIGHT_THEME,
      // ! Remove codes below
      darkTheme: DARK_THEME,
      themeMode: ThemeMode.system,
    );
  }
}
