import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:cafein_front/Login/PhoneScreen.dart';
import 'package:cafein_front/Login/SplashScreen.dart';
import 'package:cafein_front/Login/SuccessScreen.dart';
import 'package:cafein_front/Main/MainScreen.dart';
import 'package:cafein_front/Main/TestScreen.dart';
import 'package:cafein_front/Map/MapScreen.dart';
import 'package:cafein_front/Review/ReviewScreen.dart';
import 'package:flutter/material.dart';

import 'package:kakao_flutter_sdk/all.dart';
import 'Login/RegisterScreen.dart';
var normaltheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0.0
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'MainFont'
);
void main() {
  KakaoContext.clientId = "9c2c301464491f6abe7891109661c6ec";
  KakaoContext.javascriptClientId = "b7644768bbb17c15544294bec67734b1";
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:
        TestScreen(),
      theme: normaltheme
    );
  }
}
