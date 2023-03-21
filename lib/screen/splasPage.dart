import 'dart:async';
import 'package:apptest/screen/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashpage extends StatefulWidget {
  static const routeName = "splash";

  const Splashpage({Key? key}) : super(key: key);

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    checkConfi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 160.h),
          SizedBox(height: 150.h),
          const CircularProgressIndicator()
        ],
      ),
    );
  }

  void checkConfi() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LogInPage.routeName);
    });
  }
}
