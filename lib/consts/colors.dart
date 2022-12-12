import 'package:flutter/material.dart';

const Color scofldColor = Color.fromRGBO(238, 238, 238, 1);
const Color textfieldGrey = Color.fromRGBO(209, 209, 209, 1);
const Color fontGrey = Color.fromRGBO(107, 115, 119, 1);
const Color darkFontGrey = Color.fromRGBO(62, 68, 71, 1);
const Color whiteColor = Color(0xffffffff);
const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
const Color primaryColor = Color(0xff4c53a5);
const Color golden = Color(0xffFFCE01);

// metrial color

//palette.dart

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff4c53a5, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff444b95), //10%
      100: Color(0xff3d4284), //20%
      200: Color(0xff353a73), //30%
      300: Color(0xff2e3263), //40%
      400: Color(0xff262a53), //50%
      500: Color(0xff1e2142), //60%
      600: Color(0xff171931), //70%
      700: Color(0xff0f1121), //80%
      800: Color(0xff080810), //90%
      900: Color(0xff000000), //100%
    },
  );
}
