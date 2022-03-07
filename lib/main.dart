import 'package:cafein_front/Login/LoginScreen.dart';
import 'package:cafein_front/Login/SplashScreen.dart';
import 'package:cafein_front/Map/MapScreen.dart';
import 'package:flutter/material.dart';

import 'package:kakao_flutter_sdk/all.dart';
import 'Login/RegisterScreen.dart';
var normaltheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0.0
  ),
  scaffoldBackgroundColor: Colors.white
);
void main() {
  KakaoContext.clientId = "9c2c301464491f6abe7891109661c6ec";
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:
        MapScreen(),
      theme: normaltheme
    );
  }
}
