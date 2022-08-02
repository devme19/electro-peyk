import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const double BUTTON_RADIUS = 8.0;
const double INPUT_RADIUS = 8.0;

class Themes {
  static final light = ThemeData.light().copyWith(
      iconTheme: const IconThemeData(color: Colors.black54),
      backgroundColor: IColor().LIGHT_BG_COLOR,
      primaryColor: IColor().LIGHT_PRIMARY_COLOR,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: IColor().LIGHT_ACCENT_COLOR,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BUTTON_RADIUS),
              ),
              //
              primary: IColor().LIGHT_PRIMARY_COLOR,
              onPrimary: Colors.black54,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
              // backgroundColor: MaterialStateProperty.all<Color>(IColor().LIGHT_ACCENT_COLOR)
              )),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10.5),
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 32),
          headline2: TextStyle(
              color: Color(0xff5856D6),
              fontWeight: FontWeight.w700,
              fontSize: 16),
          headline3: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
          headline4: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
          headline5: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14),
          headline6: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          // bodyText1: TextStyle(
          //   color: Colors.black54,
          //   fontWeight: FontWeight.w700,
          //   fontSize: 16,
          // ),
          bodyText1: TextStyle(
            color: IColor().LIGHT_PRIMARY_COLOR,
            fontSize: 15,fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: IColor().LIGHT_PRIMARY_COLOR.withOpacity(0.3),
            fontSize: 15,fontWeight: FontWeight.bold,
          ),
          subtitle2: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
          subtitle1: TextStyle(
            color: Colors.black38,
            fontSize: 15,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 16,
          )).apply(fontFamily: "Vazir"),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(INPUT_RADIUS),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(INPUT_RADIUS),
          borderSide: BorderSide(
            color: IColor().LIGHT_PRIMARY_COLOR,
          ),

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(INPUT_RADIUS),
      borderSide: BorderSide(
        color: IColor().LIGHT_PRIMARY_COLOR,
      ),),
        filled: true,
        fillColor: Colors.white,

      ));
  static final dark = ThemeData.dark().copyWith(
      iconTheme: const IconThemeData(color: Colors.white54),
      brightness: Brightness.dark,
      backgroundColor: Colors.black54,
      primaryColor: IColor().DARK_PRIMARY_COLOR,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: IColor().DARK_PRIMARY_COLOR,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BUTTON_RADIUS),
              ),
              //
              primary: IColor().DARK_ACCENT_COLOR,
              onPrimary: Colors.black87,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
              // backgroundColor: MaterialStateProperty.all<Color>(IColor().LIGHT_ACCENT_COLOR)
              )),
      textTheme: const TextTheme(
        subtitle1:
            TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(INPUT_RADIUS),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: IColor().DARK_INPUT_COLOR,
      ));
}

class IColor {
  Color LIGHT_PRIMARY_COLOR = Color(0xff5856D6);
  Color LIGHT_BG_COLOR = Color(0xffF2F2F7);
  // Color LIGHT_BG_COLOR = Colors.red;
  Color LIGHT_ACCENT_COLOR = Colors.orange;
  Color LIGHT_Button_COLOR = Color(0xffE5E5EA);
  // Color LIGHT_Bg_COLOR = Color(0xffF2F2F7);
  Color LIGHT_ICON_COLOR = Colors.black26.withOpacity(0.1);

  Color DARK_PRIMARY_COLOR = Colors.blue;
  Color DARK_ACCENT_COLOR = Colors.lightBlueAccent;
  Color DARK_TEXT_COLOR = Colors.white38;
  Color DARK_INPUT_COLOR = Colors.black26;
}
