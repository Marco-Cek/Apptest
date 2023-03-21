import 'package:apptest/screen/splasPage.dart';
import 'package:apptest/utility/routes.dart';
import 'package:apptest/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: customLightTheme(),
            darkTheme: customLightTheme(),
            themeMode: ThemeMode.light,
            initialRoute: Splashpage.routeName,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
          );
        });
  }
}
