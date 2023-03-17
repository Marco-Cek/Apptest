import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData customLightTheme() {

  final ThemeData lightTheme = ThemeData.light();

  final Color royalBlue = HexColor("0F44B7"); //LTB1
  final Color navyBlue = HexColor("162447"); //LTB2
  final Color tangerine = HexColor("F86A0B"); //LTB3
  final Color glacier = HexColor("F6F7FB"); //LTA1
  final Color white = HexColor("FFFFFF"); //LTA2
  final Color coldGrey = HexColor("8A92A3"); //LTA3

  TextTheme _customLightThemesTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1?.copyWith(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: tangerine,
        ),
        headline2: base.headline2?.copyWith(
          fontFamily: "Outfit",
          fontSize: 29.0,
          fontWeight: FontWeight.bold,
          color: tangerine,
        ),
        headline3: base.headline3?.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: tangerine,
        ),
        headline4: base.headline4?.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: royalBlue,
        ),
        caption: base.caption?.copyWith(
          fontSize: 14,
          color: tangerine,
        ),
        bodyText1: base.bodyText1?.copyWith(
          fontSize: 17.0,
          color: tangerine,),
        bodyText2: base.bodyText2?.copyWith(
          fontSize: 17.0,
          color: Colors.black,),
        //testo sbarrato
        subtitle1: base.subtitle1?.copyWith(
          fontSize: 17.0,
          decoration: TextDecoration.lineThrough,
          color: Colors.black,),
        //testo sottolineato
        overline: base.overline?.copyWith(
          fontSize: 14.0,
          decoration: TextDecoration.underline,
          color: coldGrey,),
        //button theme
        button: base.button?.copyWith(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: glacier,),
        headline5: base.headline5?.copyWith(
          fontSize: 29.0,
          fontWeight: FontWeight.bold,
          color: tangerine,
        )
    );
  }

  return lightTheme.copyWith(
    textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
    primaryColor: royalBlue,
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: royalBlue
    ),
    iconTheme: IconThemeData(
      color: tangerine,
    ),
    scaffoldBackgroundColor: glacier,
    backgroundColor: glacier,
    errorColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
      border:  OutlineInputBorder(
          borderSide: BorderSide(color: coldGrey),
          borderRadius:  BorderRadius.all(Radius.circular(10.h))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: coldGrey),
          borderRadius:  BorderRadius.all(Radius.circular(10.h))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: tangerine),
          borderRadius:  BorderRadius.all(Radius.circular(10.h))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius:  BorderRadius.all(Radius.circular(10.h))),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: coldGrey),
          borderRadius:  BorderRadius.all(Radius.circular(10.h))),
      //iconColor:  HexColor("#FF8630")



    ),

    checkboxTheme: lightTheme.checkboxTheme.copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: MaterialStateProperty.all<Color>(royalBlue),
    ),
  );
}
